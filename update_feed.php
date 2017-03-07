<?
session_start();

require_once './settings.php';
require_once './libraries/utils_library.php';
require_once './libraries/auth_library.php';

$access_type = check_access();
if ($access_type == 'admin')
{
    $upload_option = post('upload_option');

    if ($upload_option) // Если предполагается загрузка информации из rss-ленты
    {
        $content = file_get_contents(NASA_FILE);
        $rss = new SimpleXMLElement($content); // Класс, встроенный в php
        $items = [];

        foreach ($rss->channel->item as $item) {
            // unix timestamp, соответствующий моменту публикации записи с поправкой на разницу во времени между
            // часовыми поясами, т.е. с прибавкой 8-ми часов для часового пояса Питера
            //$k = strtotime(substr(strval($item->pubDate), strpos($item->pubDate, ',') + 2));

            // unix timestamp, соответствующий моменту времени при публикации в том часовом поясе, в котором была
            // опубликована запись
            $t = date_parse_from_format('D, d M Y H:i', strval($item->pubDate));
            $ut = mktime($t['hour'], $t['minute'], 0, $t['month'], $t['day'], $t['year']);

            $items[$ut] = [
                'title' => strval($item->title),
                'link' => strval($item->link),
                'img' => strval($item->enclosure['url']),
                'description' => nl2br(strval($item->description)),
                'date' => strval($item->pubDate),
                'k_date' => date('d M Y H:i', $ut)
            ];
        }

        if ($upload_option == 'total_update') // Удалить все записи из БД и заново добавить их из rss-ленты
        {
            ksort($items); // Самый первый ID будет у самой старой записи
            $query[0] = "START TRANSACTION;";
            $query[1] = "TRUNCATE TABLE records;";
            $query[2] = "TRUNCATE TABLE comments;";
            $query[3] = "INSERT INTO records (title, description, img, link, publication_date, upload_date) VALUES ";

            foreach ($items as $date => $item)
            {
                $title = mysqli_real_escape_string($db_connection, $item['title']);
                $description = mysqli_real_escape_string($db_connection, $item['description']);
                $img = mysqli_real_escape_string($db_connection, $item['img']);
                $link = mysqli_real_escape_string($db_connection, $item['link']);
                $time = time();
                $query[3] .= "('{$title}', '{$description}', '{$img}', '{$link}', {$date}, {$time}),";
            }

            $query[3] = rtrim($query[3], ',') . ";";

            foreach ($query as $q)
            {
                if (false == mysqli_query($db_connection, $q))
                {
                    mysqli_query($db_connection, "ROLLBACK");
                    ajax_error(['text' => 'Ошибка обращения к базе данных!']);
                }
            }

            if (mysqli_query($db_connection, "COMMIT;"))
            {
                ajax_success([
                    'text' => 'База данных была полностью перезаписана! Обновите страницу, чтобы увидеть результат.'
                ]);
            }

            ajax_error(['text' => 'Ошибка обращения к базе данных!']);
        }
        elseif ($upload_option == 'total_add') // Добавить все записи, отсутствующие в БД
        {
            ksort($items); // Самый первый ID будет у самой старой записи

            // Делается массив, состоящий из дат публикации имеющихся в rss-ленте записей
            $publication_dates = array_keys($items);

            // Далее делается массив, состоящий из имеющихся в БД записей
            $result = mysqli_query($db_connection, "SELECT publication_date FROM records");
            $db_publication_dates = mysqli_fetch_all($result, MYSQLI_ASSOC);

            if (!$db_publication_dates)
            {
                ajax_error(['text' => 'Ошибка обращения к базе данных!']);
            }

            foreach ($db_publication_dates as &$v)
            {
                $v = $v['publication_date'];
            }
            unset($v);

            // Далее определяется, каких дат публикации в БД нет
            $dates_to_insert = array_diff($publication_dates, $db_publication_dates);

            $added = count($dates_to_insert);

            if ($added == 0)
            {
                ajax_success(['text' => 'Пока нет новых записей.']);
            }

            // Далее в БД добавляются недостающие записи
            $query = 'INSERT INTO records (title, description, img, link, publication_date, upload_date) VALUES ';

            foreach ($dates_to_insert as $date) {
                $title = mysqli_real_escape_string($db_connection, $items[$date]['title']);
                $description = mysqli_real_escape_string($db_connection, $items[$date]['description']);
                $img = mysqli_real_escape_string($db_connection, $items[$date]['img']);
                $link = mysqli_real_escape_string($db_connection, $items[$date]['link']);
                $time = time();
                $query .= "('{$title}', '{$description}', '{$img}', '{$link}', {$date}, {$time}),";
            }

            $query = rtrim($query, ',');

            if (mysqli_query($db_connection, $query))
            {
                ajax_success([
                    'text' => 'Было добавлено ' . $added . ' записей. Обновите страницу, чтобы увидеть результат.'
                ]);
            }

            ajax_error(['text' => 'Ошибка обращения к базе данных!']);
        }
    }
}

ajax_error(['text' => 'Нет доступа!']);