<?

function are_login_and_password_correct($login, $password)
{
    if (strlen($login) < 5 && strlen($login) > 32)
    {
        ajax_error([
            'message' => 'Допустимая длина логина - от 5 до 32 символов!',
            'target' => 'login'
        ]);
    }
    if (strlen($password) < 5 && strlen($password) > 32)
    {
        ajax_error([
            'message' => 'Допустимая длина пароля - от 5 до 32 символов!',
            'target' => 'login'
        ]);
    }
    if (!preg_match('/^[a-zA-Z0-9_]{5,32}$/', $login))
    {
        ajax_error([
            'message' => 'Недопустимые символы! Разрешены только 0-9, a-z, A-Z и "_".',
            'target' => 'login'
        ]);
    }
    if (!preg_match('/^[a-zA-Z0-9_]{5,32}$/', $password))
    {
        ajax_error([
            'message' => 'Недопустимые символы! Разрешены только 0-9, a-z, A-Z и "_".',
            'target' => 'password'
        ]);
    }
}

function check_access()
{
    global $db_connection;

    if (session('access_type'))
    {
        $table = session('access_type') . 's'; // Будет либо admins, либо users
        $id = session('id');
        $query = "SELECT * FROM {$table} WHERE id={$id}";
        $character = mysqli_fetch_assoc(mysqli_query($db_connection, $query));
        if ($character)
        {
            if (session('code') == $character['code'])
            {
                return session('access_type');
            }
        }
    }

    return false;
}

function auth_enter()
{
    global $db_connection;
    $login = trim(post('login'));
    $password = trim(post('password'));

    are_login_and_password_correct($login, $password);

    // Сначала ищется совпадение в таблице админов. Если не найдётся, тогда будет искаться среди обычных пользователей.
    foreach (['admin', 'user'] as $type)
    {
        $table = $type . 's';
        $query = "SELECT * FROM {$table} WHERE name='{$login}'";
        $person = mysqli_fetch_assoc(mysqli_query($db_connection, $query));
        if ($person)
        {
            if (md5($person['salt'] . md5($password)) == $person['password'])
            {
                $code = auth_make_code(
                    $person['salt'],
                    $password,
                    $_SERVER['HTTP_USER_AGENT'],
                    random_string(32)
                );
                $query = "UPDATE {$table} SET code='{$code}' WHERE id={$person['id']}";
                if (mysqli_query($db_connection, $query))
                {
                    $_SESSION['access_type'] = $type;
                    $_SESSION['code'] = $code;
                    $_SESSION['id'] = $person['id'];
                    $_SESSION['name'] = $person['name'];

                    ajax_success([]);
                }

                ajax_error(['message' => 'Ошибка обращения к базе данных!']);
            }

            ajax_error(['message' => 'Неверный пароль!', 'target' => 'password']);
        }
        else
        {
            continue;
        }
    }

    ajax_error(['message' => 'Пользователя с таким именем не существует!', 'target' => 'login']);
}

function auth_reg()
{
    global $db_connection;
    $login = trim(post('login'));
    $password = trim(post('password'));

    are_login_and_password_correct($login, $password);

    foreach(['admins', 'users'] as $table)
    {
        $query = "SELECT * FROM {$table} WHERE name='{$login}'";
        $result = mysqli_fetch_assoc(mysqli_query($db_connection, $query));
        if ($result) {
            ajax_error([
                'message' => 'Уже есть пользователь с таким именем!',
                'target' => 'login'
            ]);
        }
    }

    $salt = random_string(32);
    $db_password = md5($salt . md5($password));

    $query = [];
    $query[0] = "START TRANSACTION;";
    $query[1] = "INSERT INTO users (name, salt, password) VALUES ('{$login}', '{$salt}', '{$db_password}');";
    $query[2] = "SELECT LAST_INSERT_ID() as inserted_id;";

    foreach ($query as $k => $q)
    {
        $result = mysqli_query($db_connection, $q);
        if (!$result)
        {
            ajax_error(['message' => 'Ошибка обращения к базе данных!']);
        }

        if ($k == 2)
        {
            $result_id = mysqli_fetch_assoc($result);
            $inserted_id = $result_id['inserted_id'];
        }
    }

    if (false == mysqli_query($db_connection, "COMMIT"))
    {
        ajax_error(['message' => 'Ошибка обращения к базе данных!']);
    }

    $code = auth_make_code($salt, $password, $_SERVER['HTTP_USER_AGENT'], random_string(32));

    $query = "UPDATE users SET code='{$code}' WHERE id={$inserted_id}";

    if (mysqli_query($db_connection, $query))
    {
        $_SESSION['access_type'] = 'user';
        $_SESSION['code'] = $code;
        $_SESSION['id'] = $inserted_id;
        $_SESSION['name'] = $login;

        ajax_success([]);
    }

    ajax_error(['message' => 'Ошибка обращения к базе данных!']);
}

function auth_make_code(/* Здесь должен быть 1-мерный массив любого размера */)
{
    $str = '';
    $args = func_get_args();
    foreach ($args as $arg)
    {
        $str .= md5($arg);
    }
    return md5($str);
}

function auth_exit()
{
    unset($_SESSION);
    session_destroy();
    ajax_success([]);
}