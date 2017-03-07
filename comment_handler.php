<?
session_start();

require_once './settings.php';
require_once './libraries/utils_library.php';
require_once './libraries/auth_library.php';

global $db_connection;

$text = mysqli_real_escape_string($db_connection, nl2br(htmlspecialchars(trim(post('comment')))));
$author_name = session('name') ? session('name') : 'Anonym';
$author_id = session('id') ? session('id') : 0;
$record_id = post('record_id');
$date = time();

if ($text && is_numeric($record_id))
{
    $query[0] = "START TRANSACTION;";
    $query[1] = "INSERT INTO comments (item_id, author_id, author_name, text, date)
              VALUES ({$record_id}, {$author_id}, '{$author_name}', '{$text}', {$date});";
    $query[2] = "UPDATE records SET comments_count = comments_count + 1 WHERE id = {$record_id}";

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
        ajax_success([
            'name' => $author_name,
            'text' => str_replace(['\n', '\n\r', '\r\n'], ['', '', ''], $text),
            'date' => $date
        ]);
    }

    ajax_error(['text' => 'Ошибка обращения к базе данных!']);
}