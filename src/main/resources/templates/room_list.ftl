<#import "parts/common.ftl" as c>

<@c.page>
<div>
    <a href="/room/edit">Добавить новое помещение</a>
</div>
<br>
<div>
    <table border="1">
        <tr>
            <td>ID записи в бд</td>
            <td>Номер помещения в квартире</td>
            <td>Площадь помещения</td>
            <td>Размеры помещения  в плане</td>
            <td>Назначение (кухня, ниша …</td>
            <td>Отделка (паркет, обои …)</td>
            <td>Высота помещения</td>
            <td>Число розеток в помещении</td>
            <td>Число элементов в батарее отопления</td>
            <td>Квартира</td>
            <td></td>
            <td></td>
        </tr>
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
            <td><a href="/room/edit/${room.id}">Изменить</a></td>
            <td><a href="/room/delete/${room.id}">Удалить</a></td>
        </tr>
    </#list>
    </table>
</div>
</@c.page>