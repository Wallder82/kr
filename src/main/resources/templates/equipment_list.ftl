<#import "parts/common.ftl" as c>

<@c.page>
<div class="container-fluid">
<br>
<br>
<h2 >Оборудование</h2>
<br>
<div class="container-fluid mt-5">
    <a class="btn btn-primary btn-lg active" role="button" aria-pressed="true" href="/equipment/edit">Добавить новое
        оборудование</a>
</div>
<div class="container-fluid">
    <table class="table table-hover">
        <thead>
        <tr>
            <td>ID</td>
            <td>Название</td>
            <td>Описание</td>
            <td>Количество</td>
            <td></td>
            <td></td>
        </tr>
        </thead>
        <tbody>
        <#list equipment_list as equipment>
        <tr>
            <td>${equipment.id?ifExists}</td>
            <td>${equipment.name?ifExists}</td>
            <td>${equipment.description?ifExists}</td>
            <td>${equipment.count?ifExists}</td>
            <td><a class="btn btn-secondary btn-lg active" role="button" aria-pressed="true"
                   href="/equipment/edit/${equipment.id}">Изменить</a></td>
            <td><a class="btn btn-secondary btn-lg active" role="button" aria-pressed="true"
                   href="/equipment/delete/${equipment.id}">Удалить</a></td>
        </tr>
        </#list>
        </tbody>
    </table>
</div>
</div>
</@c.page>