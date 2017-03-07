$(function() {
    var $totalWrapper = $('#total-wrapper');
    var minHeight = window.innerHeight - parseInt($totalWrapper.css('marginTop')) - parseInt($totalWrapper.css('marginBottom'));
    $totalWrapper.css('minHeight', minHeight);

    var $record_edit_submit_btn = $('#record-editing-submit');

    // Открытие формы входа/регистрации
    $('.main-head-top-auth-btn').click(function(e)
    {
        e.preventDefault();
        $($(this).data('target')).css({
            bottom: '0',
            opacity: '1'
        });
    });

    /**
     * Убрать форму по нажатии на тёмное пространство вокруг неё. Актуально для всех выезжающих форм, например, для
     * формы авторизации или для формы редактирования записи админом
     */
    $('.sliding-space').click(function(e)
    {
        if (e.target.id == $(this).attr('id'))
        {
            $(this).css({
                bottom: '100%',
                opacity: '0'
            });
        }
    });

    // Попытка зарегистрироваться или зайти на сайт
    $('.auth-btn').click(function(e) {
        e.preventDefault();
        var this_btn = e.target,
            action = this_btn.getAttribute('data-action');
        $.ajax({
            url: '/index.php',
            type: 'post',
            data: "ajax-action=" + action
                + "&login=" + $('#' + action + '-login').val()
                + "&password=" + $('#' + action + '-password').val(),
            dataType: 'json',
            beforeSend: function()
            {
                this_btn.disabled = true;
            },
            complete: function()
            {
                this_btn.disabled = false;
            },
            success: function(response)
            {
                if (!response.error)
                {
                    window.location = window.location;
                }
                else
                {
                    $('.wrong-filled').removeClass('wrong-filled');
                    $('#' + action + '-notice').html(response.message).slideDown(250);
                    if (response.target)
                    {
                        $('#' + action + '-' + response.target).addClass('wrong-filled');
                    }
                }
            },
            error: function()
            {
                $('#' + action + '-notice').html('Какая-то ошибка! Попробуйте позже!').css('color', 'rgb(255,55,55)')
                    .slideDown(250);
            }
        });
    });

    // Выход с сайта
    $('#exit-btn').click(function(e) {
        e.preventDefault();
        $.ajax({
            url: '/index.php',
            type: 'post',
            data: "ajax-action=exit",
            dataType: 'json',
            success: function()
            {
                window.location = window.location;
            },
            error: function()
            {
                alert('Выход не удался...');
            }
        });
    });

    // Обновление в БД таблицы записей из rss-ленты NASA
    $('.upload-option:enabled').click(function()
    {
        var allCoolBtns = $('.upload-option:enabled');
        $.ajax({
            url: '/update_feed.php',
            type: 'post',
            data: "upload_option=" + $(this).data('upload-option'),
            dataType: 'json',
            beforeSend: function()
            {
                allCoolBtns.prop('disabled', true);
            },
            complete: function()
            {
                allCoolBtns.prop('disabled', false);
            },
            success: function(response)
            {
                var color = (response.error) ? 'rgb(255,155,155)' : 'rgb(155,255,155)';
                $('#response').html(response.text).css({
                    'background' : color,
                    'opacity' : 1
                });
            },
            error: function()
            {
                $('#response').html('Какая-то ошибка!').css({
                    'background' : 'rgb(255,155,155)',
                    'opacity' : 1
                });
            }
        });
    });

    // Действия с записями (редактирование/удаление)
    $('.record-act-btn').click(function()
    {
        var action = $(this).data('action'),
            record_id = $(this).data('id');

        // Редактирование записи - показать форму редактирования
        if (action == 'edit')
        {
            var title = $.trim($('#record-title-' + record_id).html()),
                description = $.trim($('#record-description-' + record_id).html()).replace(/<br>|<br\/>|<br \/>/g, '');
            $('#record-form').css({
                bottom: '0',
                opacity: '1'
            });
            $('#record-title').val(title);
            $('#record-description').val(description);
            $record_edit_submit_btn.data('id', record_id);
        }
        // удаление записи
        else if (action == 'delete')
        {
            $.ajax({
                url: '/index.php',
                type: 'post',
                data: 'ajax-action=record_delete&record_id=' + record_id,
                dataType: 'json',
                success: function(response)
                {
                    if (response.error)
                    {
                        $('#response').html(response.text).css({
                            'background' : 'rgb(255,155,155)',
                            'opacity' : 1
                        });
                    }
                    else
                    {
                        var $row_to_remove = $('#tr-record-' + record_id);
                        $row_to_remove.slideUp(250, function() {
                            $row_to_remove.remove();
                        }); // Ряд исчезает, но слайд ап не работает..
                    }
                },
                error: function()
                {
                    $('#response').html('Какая-то ошибка!').css({
                        'background' : 'rgb(255,155,155)',
                        'opacity' : 1
                    });
                }
            });
        }
    });

    // Сохранение в БД отредактированной записи
    $record_edit_submit_btn.click(function(e) {
        e.preventDefault();
        var record_id = $record_edit_submit_btn.data('id'),
            title = $('#record-title').val(),
            description = $('#record-description').val();
        $.ajax({
            url: '/index.php',
            type: 'post',
            data: "ajax-action=record_edit&record_id=" + record_id + "&title=" + title + "&description=" + description,
            dataType: 'json',
            beforeSend: function()
            {
                $record_edit_submit_btn.attr('disabled', true);
            },
            complete: function()
            {
                $record_edit_submit_btn.attr('disabled', false);
            },
            success: function(response)
            {
                var color = (response.error) ? 'rgb(255,155,155)' : 'rgb(155,255,155)';
                $('#record-notice').html(response.text).css('background', color).slideDown(250);
                $('#record-title-' + record_id).html(title);
                $('#record-description-' + record_id).html(description);
            },
            error: function()
            {
                $('#record-notice').html('Какая-то ошибка!').css('background', 'rgb(255,155,155)').slideDown(250);
            }
        });
    });

    // Добавление комментария
    $('#leave-comment-btn').click(function(e)
    {
        var this_btn = e.target;
        $.ajax({
            url: '/comment_handler.php',
            type: 'post',
            data: 'comment=' + $('#leave-comment-textarea').val() + "&record_id=" + $(this).data('item-id'),
            dataType: 'json',
            beforeSend: function()
            {
                this_btn.disabled = true;
            },
            complete: function()
            {
                this_btn.disabled = false;
            },
            success: function(comment)
            {
                if (!comment.error)
                {
                    var html = $('#comment-template').html().replace(/COMMENT_AUTHOR_NAME/, comment.name)
                        .replace(/COMMENT_TEXT/, comment.text).replace(/COMMENT_DATE/, comment.date);
                    $('.item-comments-field').append(html);
                    $('#leave-comment-textarea').val('');
                    var $ccs = $('#comments-count');
                    $ccs.html(parseInt($ccs.html()) + 1);
                }
                else
                {
                    alert('Не вышло! Но что-то было!');
                }
            },
            error: function()
            {
                alert('Не вышло!');
            }
        });
    });
});