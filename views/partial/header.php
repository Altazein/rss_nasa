<!DOCTYPE html>
<html>
<head>
    <meta name="robots" content="noindex">
    <meta charset="utf-8"/>
    <title>NASA reader</title>
    <link rel="stylesheet" href="/CSS/main.css"/>
    <script src="/JS/jQuery.js"></script>
    <script src="/JS/main.js"></script>
</head>
<body>
    <div id="total-wrapper">
        <header class="main-head">
            <div class="main-head-top">
                <div class="main-head-top-content">
                    <div class="main-head-top-logo">RSS-лента NASA</div>
                    <div class="main-head-top-auth">

                        <? if ($display['unauthorized']) {?>
                            <button class="main-head-top-auth-btn" data-target="#enter-form">
                                Войти
                            </button>
                            <button class="main-head-top-auth-btn" data-target="#reg-form">
                                Зарегистрироваться
                            </button>
                        <?}?>

                        <? if ($display['authorized']) {?>
                            <form action="/index.php" method="post">
                                <div class="main-head-top-auth-name"><?=session('name')?></div>
                                <button id="exit-btn" class="main-head-top-auth-btn-skipJS" type="submit"
                                        name="exit" value="yes">Выход</button>
                            </form>
                        <?}?>

                        <div class="sliding-space" id="enter-form">
                            <div class="sliding-form small-form">
                                <form action="/index.php" method="post">
                                    <div class="sliding-form-head">Вход</div>
                                    <div class="sliding-form-group">
                                        <label class="sliding-form-label" for="enter-login">Логин</label>
                                        <input id="enter-login" class="sliding-form-input" name="login" type="text"/>
                                    </div>
                                    <div class="sliding-form-group">
                                        <label class="sliding-form-label" for="enter-password">Пароль</label>
                                        <input id="enter-password" class="sliding-form-input" type="password" name="password"/>
                                    </div>
                                    <div class="sliding-form-group">
                                        <div id="enter-notice" class="sliding-form-notice">Тратата</div>
                                    </div>
                                    <div class="sliding-form-group">
                                        <button class="sliding-form-btn auth-btn cool-btn" data-action="enter" type="submit">
                                            Войти
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div class="sliding-space" id="reg-form">
                            <div class="sliding-form small-form">
                                <form action="/index.php" method="post">
                                    <div class="sliding-form-head">Регистрация</div>
                                    <div class="sliding-form-group">
                                        <label class="sliding-form-label" for="reg-login">Логин</label>
                                        <input id="reg-login" class="sliding-form-input" name="login" type="text"/>
                                    </div>
                                    <div class="sliding-form-group">
                                        <label class="sliding-form-label" for="reg-password">Пароль</label>
                                        <input id="reg-password" class="sliding-form-input" type="password" name="password"/>
                                    </div>
                                    <div class="sliding-form-group">
                                        <div id="reg-notice" class="sliding-form-notice"></div>
                                    </div>
                                    <div class="sliding-form-group">
                                        <button class="sliding-form-btn auth-btn cool-btn" data-action="reg" type="submit">
                                            Зарегистрироваться
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="main-head-bot">
                <nav class="main-head-bot-nav">
                    <ul>
                        <li><a href="/index.php">Главная</a></li>
                    </ul>
                </nav>
            </div>
        </header>
        <div class="content-wrapper">