<#import "parts/common.ftl" as c>

<@c.page>
<div class="container-fluid">
    <br>
    <h2 >Мои заявки</h2>
    <br>
<div class="container-fluid">
    <table class="table table-hover">
        <thead>
        <tr>
            <td>ID</td>
            <td>Статус</td>
            <td>Описание</td>
            <td></td>
            <td></td>
        </tr>
        </thead>
        <tbody>
        <#list application_list as application>
        <tr>
            <td>${application.id?ifExists}</td>
            <td>${application.status?ifExists}</td>
            <td>${application.description?ifExists}</td>
            <td><a class="btn btn-secondary btn-lg active" role="button" aria-pressed="true"
                   href="/application/edit/${application.id}">Изменить</a></td>
            <td><a class="btn btn-secondary btn-lg active" role="button" aria-pressed="true"
                   href="/application/delete/${application.id}">Удалить</a></td>
        </tr>
        </#list>
        </tbody>
    </table>
</div>
</div>
</@c.page>