<?

define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASSWORD', '');
define('DB_NAME', 'NASA_reader_db');
define('NASA_FILE', 'https://www.nasa.gov/rss/dyn/lg_image_of_the_day.rss');
define('RECORDS_PER_PAGE', 10);

$db_connection = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);