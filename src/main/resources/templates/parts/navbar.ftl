<#include "security.ftl">
<div class="container-fluid">
<ul class="nav nav-pills">
    <a class="navbar-brand" href="/">My EQUIPMENT</a>
    <#if known>
    <li class="nav-item">
        <a class="nav-link active" href="/application/create_blank/${session_user.username}">Создать новую заявку</a>
    </li>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Заявки</a>
        <div class="dropdown-menu">
            <a class="dropdown-item" href="#">Мое оборудование</a>
            <a class="dropdown-item" href="#">Another action</a>
            <a class="dropdown-item" href="#">Something else here</a>
            <#if isAdmin || isManager>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="/application/list/${session_user.username}">Мои заявки</a>
            </#if>
        </div>
    </li>
        <#if isAdmin>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Администрирование</a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="/equipment/list">Оборудование</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="/user/list">Пользователи</a>
                </div>
            </li>
        </#if>
    </#if>

    <#if known = false>
    <li class="nav-item">
        <a class="nav-link" href="/login">Войти</a>
    </li>
    <#else>
    <form action="/logout" method="post">
        <button type="submit" class="btn btn-secondary">Выйти</button>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    </form>
    </#if>
</ul>
</div>