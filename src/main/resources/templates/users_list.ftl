<#import "parts/common.ftl" as c>

<@c.page>
<div class="container-fluid mt-5">
    <a class="btn btn-primary btn-lg active" role="button" aria-pressed="true" href="/registration">Создать пользователя</a>
</div>
<br>
<div class="container-fluid">
    <table class="table table-hover">
        <thead>
        <tr>
            <td>ID</td>
            <td>Логин</td>
            <td>Активность</td>
            <td>Имя</td>
            <td>Фамилия</td>
            <td>Отчество</td>
            <td>Level</td>
            <td>Роли</td>
            <td></td>
            <td></td>
        </tr>
        </thead>
        <tbody>
        <#list users_list as user>
        <tr>
            <td>${user.id?ifExists}</td>
            <td>${user.username?ifExists}</td>
            <td><#if user.active == true>✔<#else>❌</#if></td>
            <td>${user.name?ifExists}</td>
            <td>${user.surname?ifExists?string}</td>
            <td>${user.middleName?ifExists}</td>
            <td>${user.level?ifExists}</td>
            <td><#list user.roles as role>${role}<#sep>, </#list></td>
            <td><a class="btn btn-secondary btn-lg active" role="button" aria-pressed="true"
                   href="/user/edit/${user.id}">Изменить</a></td>
            <td><a class="btn btn-secondary btn-lg active" role="button" aria-pressed="true"
                   href="/user/delete/${user.id}">Удалить</a></td>
        </tr>
        </#list>
        </tbody>
    </table>
</div>
</@c.page>