<#import "parts/common.ftl" as c>

<@c.page>
<div>
    <a href="/building/edit">Добавить новое здание</a>
</div>
<br>
<div>
    <table border="1">
        <tr>
            <td>Кадастровый номер здания</td>
            <td>Адрес здания</td>
            <td>Район города</td>
            <td>Площадь земельного участка</td>
            <td>Год постройки здания</td>
            <td>Материал стен здания</td>
            <td>Материал фундамента</td>
            <td>Примечания</td>
            <td>Износ в процентах</td>
            <td>Количество этажей в здании</td>
            <td>Расстояние от центра города</td>
            <td>Площадь квартир</td>
            <td>Фото здания</td>
            <td>Количество квартир в здании</td>
            <td>Наличие лифта</td>
            <td></td>
            <td></td>
        </tr>
        <#list building_list as building>
            <tr>
                <td>${building.kadastr?ifExists}</td>
                <td>${building.address?ifExists}</td>
                <td>${building.district?ifExists}</td>
                <td>${building.land?ifExists}</td>
                <td>${building.constructionYear?ifExists}</td>
                <td>${building.material?ifExists}</td>
                <td>${building.base?ifExists}</td>
                <td>${building.comment?ifExists}</td>
                <td>${building.wear?ifExists}</td>
                <td>${building.flow?ifExists}</td>
                <td>${building.line?ifExists}</td>
                <td>${building.square?ifExists}</td>
                <td> </td>
                <td>${building.flats?ifExists}</td>
                <td>${building.elevator?ifExists?string}</td>
                <td><a href="/building/edit/${building.kadastr}">Изменить</a></td>
                <td><a href="/building/delete/${building.kadastr}">Удалить</a></td>
            </tr>
        </#list>
    </table>
</div>
</@c.page>