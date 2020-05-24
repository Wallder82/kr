<#import "parts/common.ftl" as c>

<@c.page>
<div class="container-fluid">
    <br>
    <br>
    <h2 >Мое оборудование</h2>
    <br>
    <div class="container-fluid">
        <table class="table table-hover">
            <thead>
            <tr>
                <td>ID</td>
                <td>Дата выдачи</td>
                <td>Номер заявки</td>
                <td>Название</td>
                <td>Описание</td>
                <td>Количество</td>
            </tr>
            </thead>
            <tbody>
            <#list equipment_list as equipment>
            <tr>
                <td>${equipment.id?ifExists}</td>
                <td>${equipment.setTime?ifExists}</td>
                <td>${equipment.application.id?ifExists}</td>
                <td>${equipment.equipment.name?ifExists}</td>
                <td>${equipment.equipment.description?ifExists}</td>
                <td>${equipment.count?ifExists}</td>
            </tr>
            </#list>
            </tbody>
        </table>
    </div>
</div>
</@c.page>