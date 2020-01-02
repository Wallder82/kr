<#import "parts/common.ftl" as c>

<@c.page>
<div class="container-fluid mt-5">
    <a class="btn btn-primary btn-lg active" role="button" aria-pressed="true" href="/houseroom/edit">Добавить новую квартиру</a>
</div>
<br>
<div class="container-fluid">
    <table class="table table-striped table-dark">
        <tr>
            <td>ID записи в бд</td>
            <td>Номер квартиры</td>
            <td>Номер этажа</td>
            <td>Количество комнат</td>
            <td>Квартира в двух уровнях</td>
            <td>Общая площадь квартиры</td>
            <td>Жилая площадь квартиры</td>
            <td>Вспомогательная площадь квартиры</td>
            <td>Площадь балкона</td>
            <td>Высота квартиры</td>
            <td>Кадастровый номер здания</td>
            <td></td>
            <td></td>
        </tr>
        <#list houseroom_list as houseroom>
        <tr>
            <td>${houseroom.id?ifExists}</td>
            <td>${houseroom.flat?ifExists}</td>
            <td>${houseroom.storey?ifExists}</td>
            <td>${houseroom.rooms?ifExists}</td>
            <td>${houseroom.twoLevel?ifExists?string}</td>
            <td>${houseroom.squareFlat?ifExists}</td>
            <td>${houseroom.dwell?ifExists}</td>
            <td>${houseroom.branch?ifExists}</td>
            <td>${houseroom.balcony?ifExists}</td>
            <td>${houseroom.height?ifExists}</td>
            <td>${houseroom.building.kadastr?ifExists}</td>
            <td><a class="btn btn-secondary btn-lg active" role="button" aria-pressed="true" href="/houseroom/edit/${houseroom.id}">Изменить</a></td>
            <td><a class="btn btn-secondary btn-lg active" role="button" aria-pressed="true" href="/houseroom/delete/${houseroom.id}">Удалить</a></td>
        </tr>
    </#list>
    </table>
</div>
</@c.page>