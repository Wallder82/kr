<#import "parts/common.ftl" as c>

<@c.page>
<div class="container-fluid mt-5">
    <a class="btn btn-primary btn-lg active" role="button" aria-pressed="true" href="/room/edit">Добавить новое
        помещение</a>
</div>
<br>
<div class="container-fluid">
    <table class="table table-hover">
        <thead>
        <tr>
            <td>ID записи в бд</td>
            <td>Номер помещения в квартире</td>
            <td>Площадь помещения</td>
            <td>Размеры помещения в плане</td>
            <td>Назначение (кухня, ниша …</td>
            <td>Отделка (паркет, обои …)</td>
            <td>Высота помещения</td>
            <td>Число розеток в помещении</td>
            <td>Число элементов в батарее отопления</td>
            <td>Квартира</td>
            <td></td>
            <td></td>
        </tr>
        </thead>
        <tbody>
        <#list room_list as room>
        <tr>
            <td>${room.id?ifExists}</td>
            <td>${room.record?ifExists}</td>
            <td>${room.squareRoom?ifExists}</td>
            <td>${room.size?ifExists}</td>
            <td>${room.name?ifExists?string}</td>
            <td>${room.decoration?ifExists}</td>
            <td>${room.heightRoom?ifExists}</td>
            <td>${room.socket?ifExists}</td>
            <td>${room.sections?ifExists}</td>
            <td>${room.houseroom.id?ifExists}</td>
            <td><a class="btn btn-secondary btn-lg active" role="button" aria-pressed="true"
                   href="/room/edit/${room.id}">Изменить</a></td>
            <td><a class="btn btn-secondary btn-lg active" role="button" aria-pressed="true"
                   href="/room/delete/${room.id}">Удалить</a></td>
        </tr>
        </#list>
        </tbody>
    </table>
</div>
</@c.page>