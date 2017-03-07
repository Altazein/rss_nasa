<?
function post($param)
{
    return (isset($_POST[$param])) ? $_POST[$param] : null;
}

function get($param)
{
    return (isset($_GET[$param])) ? $_GET[$param] : null;
}

function session($param)
{
    return (isset($_SESSION[$param])) ? $_SESSION[$param] : null;
}

function ajax_success($response_params)
{
    $response['error'] = false;
    foreach ($response_params as $k => $v)
    {
        $response[$k] = $v;
    }
    echo json_encode($response);
    exit();
}

function ajax_error($response_params)
{
    $response['error'] = true;
    foreach ($response_params as $k => $v)
    {
        $response[$k] = $v;
    }
    echo json_encode($response);
    exit();
}

function random_string($length)
{
    $symbols = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    $max_pos = strlen($symbols) - 1;
    $str = '';
    for ($i = 0; $i < $length; $i++)
    {
        $str .= substr($symbols, mt_rand(0, $max_pos), 1);
    }
    return $str;
}

function decide_what_to_display($access)
{
    $display = [];
    if ($access)
    {
        $display['authorized'] = true;
        $display['unauthorized'] = false;
        if ($access == 'admin')
        {
            $display['records_operations'] = true;
        }
        else
        {
            $display['records_operations'] = false;
        }
    }
    else
    {
        $display['authorized'] = false;
        $display['unauthorized'] = true;
        $display['records_operations'] = false;
    }
    return $display;
}

function db_get_records($page)
{
    global $db_connection;
    $offset = ($page - 1) * RECORDS_PER_PAGE;
    $rpp = RECORDS_PER_PAGE;

    $query = "SELECT * FROM records ORDER BY publication_date DESC LIMIT {$offset}, {$rpp}";
    $result = mysqli_query($db_connection, $query);
    return mysqli_fetch_all($result, MYSQLI_ASSOC);
}

function db_get_single_record($id)
{
    global $db_connection;
    if (is_numeric($id))
    {
        $result = mysqli_query($db_connection, "SELECT * FROM records WHERE id={$id} LIMIT 1");
        $record = mysqli_fetch_assoc($result);
        $result = mysqli_query($db_connection, "SELECT * FROM comments WHERE item_id={$id}");
        $record['comments'] = mysqli_fetch_all($result, MYSQLI_ASSOC);
        return $record;
    }
}

function db_count_records()
{
    global $db_connection;
    $query = "SELECT count(*) AS counted FROM records";
    $return = mysqli_fetch_assoc(mysqli_query($db_connection, $query));
    return $return['counted'];
}

function make_pagination_links($pages, $page, $class, $side_links = 2)
{
    $html = '<div class="' . $class . '"><ul>';

    if ($page > ($side_links + 1))
    {
        $html .= '<li class="first"><a href="' . $_SERVER['PHP_SELF'] . '?page=1">&laquo;</a></li>';
    }

    $current_page = (($page - $side_links) < 1) ? 1 : ($page - $side_links);
    $last_page = (($page + $side_links) > $pages) ? $pages : ($page + $side_links);

    while ($current_page <= $last_page)
    {
        $class_current = ($current_page == ($page)) ? ' class="current" ' : '';
        $html .=
            '<li' . $class_current . '>
                <a href="' . $_SERVER['PHP_SELF'] . '?page=' . ($current_page) . '">' . ($current_page) . '</a>
            </li>';
        $current_page++;
    }

    if ($page < ($pages - $side_links))
    {
        $html .= '<li class="last"><a href="' . $_SERVER['PHP_SELF'] . '?page=' . $pages . '">&raquo;</a></li>';
    }

    $html .= '</ul></div>';
    echo $html;
}

function record_delete()
{
    global $db_connection;

    $id = post('record_id');

    if (is_numeric($id))
    {
        $query[0] = "START TRANSACTION;";
        $query[1] = "DELETE FROM comments WHERE item_id={$id};";
        $query[2] = "DELETE FROM records WHERE id={$id} LIMIT 1;";

        foreach ($query as $q)
        {
            if (false == mysqli_query($db_connection, $q))
            {
                mysqli_query($db_connection, "ROLLBACK");
                ajax_error(['text' => 'Ошибка обращения к базе данных!']);
            }
        }

        if (mysqli_query($db_connection, "COMMIT"))
        {
            ajax_success(['text' => 'Запись была успешно удалена.']);
        }

        ajax_error(['text' => 'Ошибка обращения к базе данных!']);
    }

    ajax_error(['text' => 'Не целочисленный ID записи. Странно, что до такого вообще дошло.']);
}

function record_edit()
{
    global $db_connection;

    $id = post('record_id');
    $title = mysqli_real_escape_string($db_connection, htmlspecialchars(trim(post('title'))));
    $description = mysqli_real_escape_string($db_connection, nl2br(htmlspecialchars(trim(post('description')))));

    if (is_numeric($id))
    {
        $query = "UPDATE records SET title='{$title}', description='{$description}' WHERE id={$id} LIMIT 1";

        if (false == mysqli_query($db_connection, $query))
        {
            ajax_error(['text' => 'Ошибка обращения к базе данных!']);
        }

        ajax_success(['text' => 'Запись была успешно обновлена.']);
    }

    ajax_error(['text' => 'Не целочисленный ID записи. Странно, что до такого вообще дошло.']);
}