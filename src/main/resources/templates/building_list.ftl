<#import "parts/common.ftl" as c>

<@c.page>
<div>
    <table>
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
            <td>Квартиры</td>
        </tr>
        <#list building_list as building>
            <tr>
                <td>${building.kadastr}</td>
                <td>${building.address}</td>
                <td>${building.district}</td>
                <td>${building.land}</td>
                <td>${building.constructionYear}</td>
                <td>${building.material}</td>
                <td>${building.base}</td>
                <td>${building.comment}</td>
                <td>${building.wear}</td>
                <td>${building.flow}</td>
                <td>${building.line}</td>
                <td>${building.square}</td>
                <td>${building.picture}</td>
                <td>${building.flats}</td>
                <td>${building.elevator}</td>
            </tr>
        </#list>
    </table>
</div>
</@c.page>