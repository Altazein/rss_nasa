<div class="item-container">
    <header class="item-head">
        <div class="item-head-top">
            <h1 class="item-head-h1"><?=$record['title']?></h1>
        </div>
        <div class="item-head-bottom">
            <a href="<?=$record['link']?>">Посмотреть на сайте NASA</a>
        </div>
    </header>
    <div class="item-pic">
        <img class="item-pic-img" src="<?=$record['img']?>" alt=""/>
    </div>
    <div class="item-description">
        <?=$record['description']?>
    </div>
    <div class="item-comments">
        <div class="item-comments-head">
            Комментарии (<span id="comments-count"><?=$record['comments_count']?></span>)
        </div>
        <div class="item-comments-field">

            <? foreach ($record['comments'] as $comment) {?>
                <div class="item-comments-field-comment">
                    <div class="item-comments-field-comment-head">
                        <div><b><?=$comment['author_name']?></b> said:</div>
                        <div><?=date('d-m-Y H:i', $comment['date'])?></div>
                    </div>
                    <div class="item-comments-field-comment-text">
                        <?=$comment['text']?>
                    </div>
                </div>
            <?}?>

        </div>
    </div>
    <div class="item-leave-comment">
        <label for="leave-comment-textarea" class="item-leave-comment-label">Оставить комментарий</label>
        <textarea id="leave-comment-textarea" class="item-leave-comment-textarea" name="leave-comment"
                  rows="10" placeholder="Оставить комментарий..."></textarea>
        <button id="leave-comment-btn" class="cool-btn" data-item-id="<?=$record['id']?>">Отправить</button>
    </div>
</div>

<div id="comment-template" style="display: none">
    <div class="item-comments-field-comment">
        <div class="item-comments-field-comment-head">
            <div><b>COMMENT_AUTHOR_NAME</b> said:</div>
            <div>COMMENT_DATE</div>
        </div>
        <div class="item-comments-field-comment-text">COMMENT_TEXT</div>
    </div>
</div>