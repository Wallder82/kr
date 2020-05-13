<#import "parts/common.ftl" as c>

<@c.page>
<h3 align="center">Авторизация</h3>
<div class="container mt-5">
    <form method="post" enctype="multipart/form-data" action="/login">
        <div class="form-group row">
            <label for="username" class="col-sm-3 col-form-label">Логин</label>
            <div class="col-sm-6">
                <input class="form-control" type="text" name="username" id="username" size="30" maxlength="30"/>
            </div>
        </div>
        <div class="form-group row">
            <label for="password" class="col-sm-3 col-form-label">Пароль</label>
            <div class="col-sm-6">
                <input class="form-control" type="password" name="password" id="password" size="30" maxlength="60"/>
            </div>
        </div>

        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div class="form-group row">
            <div class="col-sm-3">
                <button type="submit" class="btn btn-primary">Войти</button>
            </div>
        </div>
        <a class="btn btn-primary" href="/registration" role="button">Регистрация</a>
    </form>
    </div>
</@c.page>