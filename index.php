<?

session_start();

require_once './settings.php';
require_once './libraries/utils_library.php';
require_once './libraries/auth_library.php';

$access = check_access();
$display = decide_what_to_display($access);
$ajax_action = post('ajax-action');

if ($ajax_action)
{
    /** Какие могут быть функции:
     *  - auth_enter, auth_exit, auth_reg
     *  - record_edit, record_delete
     * Все они не имеют аргументов.
     */
    if ($access == 'admin')
    {
        $function_name = function_exists($ajax_action) ? $ajax_action : 'auth_' . $ajax_action;
    }
    else
    {
        $function_name = 'auth_' . $ajax_action;
    }

    if (function_exists($function_name))
    {
        call_user_func($function_name);
    }

    exit();
}

require_once './views/partial/header.php';

if (get('item'))
{
    $record = db_get_single_record(get('item'));
    if ($record)
    {
        require_once './views/item.php';
    }
}
else
{
    $page = (get('page')) ? get('page') : 1;
    $records = db_get_records($page);
    $total_pages = ceil(db_count_records()/RECORDS_PER_PAGE);
    require_once './views/index.php';
}

require_once './views/partial/footer.php';