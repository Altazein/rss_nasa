<? if ($display['records_operations']) {?>
    <div class="upload-panel">
        <div class="upload-panel-item">
            <div class="upload-panel-item-btn">
                <button class="cool-btn upload-option" data-upload-option="total_update">Перезапись</button>
            </div>
            <div class="upload-panel-item-text">
                - очистить БД от записей и заново загрузить их из RSS-ленты
            </div>
        </div>
        <div class="upload-panel-item">
            <div class="upload-panel-item-btn">
                <button class="cool-btn upload-option" data-upload-option="total_add">Обновление</button>
            </div>
            <div class="upload-panel-item-text">
                - добавить в БД отсутствующие записи (новые и удалённые)
            </div>
        </div>
    </div>
    <div id="response"></div>
<?}?>

<div class="records-table">
    <?make_pagination_links($total_pages, $page, 'pagination pagination-first')?>
    <table class="records-table-table">
        <colgroup>
            <col/>

            <? if ($display['records_operations']) {?>
                <col/>
                <col width="300"/>
            <?} else {?>
            <col width="400"/>
            <?}?>

        </colgroup>
        <tr>
            <th>ID</th>

            <? if ($display['records_operations']) {?>
                <th>Actions</th>
            <?}?>

            <th>Title</th>
            <th>Publication date</th>
            <th>Upload date</th>
            <th>Comments</th>
        </tr>
        <? foreach ($records as $record) { ?>
            <tr id="tr-record-<?=$record['id']?>">
                <td><?=$record['id']?></td>

                <? if ($display['records_operations']) {?>
                    <td class="record-td">
                        <button class="record-act-btn" data-id="<?=$record['id']?>" data-action="edit"></button>
                        <button class="record-act-btn" data-id="<?=$record['id']?>" data-action="delete"></button>
                    </td>
                <?}?>

                <td>
                    <a id="record-title-<?=$record['id']?>" href="<?=$_SERVER['PHP_SELF'] . '?item=' . $record['id']?>">
                        <?=$record['title']?>
                    </a>
                </td>
                <td>
                    <a href="<?=$record['link']?>">
                        <?=date('D, d M Y H:i', $record['publication_date']) . ' EST'?>
                    </a>
                </td>
                <td><?=date('D, d M Y H:i', $record['upload_date'])?></td>
                <td><?=$record['comments_count']?></td>
            </tr>
        <?}?>
    </table>
    <?make_pagination_links($total_pages, $page, 'pagination pagination-last')?>
</div>

<? if ($display['records_operations']) {?>
    <div class="sliding-space" id="record-form">
        <div class="sliding-form wide-form">
            <form action="/index.php" method="post">
                <div class="sliding-form-head">Редактирование записи</div>
                <div class="sliding-form-pic">
                    <img class="sliding-form-pic-img" src="" alt=""/>
                </div>
                <div class="sliding-form-group">
                    <label class="sliding-form-label" for="record-title">Заголовок</label>
                    <textarea id="record-title" class="sliding-form-textarea" rows="3"></textarea>
                </div>
                <div class="sliding-form-group">
                    <label class="sliding-form-label" for="record-description">Описание</label>
                    <textarea id="record-description" class="sliding-form-textarea" rows="20"></textarea>
                </div>
                <div class="sliding-form-group">
                    <div id="record-notice" class="sliding-form-notice"></div>
                </div>
                <div class="sliding-form-group">
                    <button id="record-editing-submit" class="sliding-form-btn cool-btn" data-id="0">
                        Сохранить
                    </button>
                </div>
            </form>
        </div>
    </div>
<?}?>

<!-- Дальнейшая разметка нужна только для того, чтобы предоставлять описание записи в форме редактирования, чтобы
    не загружать его отдельно, т.к. отображаемые в таблице сведения его не содержат -->
<div class="record-descriptions" style="display: none">
    <? foreach ($records as $record) { ?>
        <div id="record-description-<?=$record['id']?>"><?=$record['description']?></div>
    <?}?>
</div>