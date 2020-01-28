<#import "parts/common.ftl" as c>

<@c.page>
<div class="container-fluid mt-5">
    <a class="btn btn-primary btn-lg active" role="button" aria-pressed="true" href="/building/edit">Добавить новое
        здание</a>
</div>
<br>
<div class="container-fluid">
    <table class="table table-hover">
        <thead>
        <tr>
            <th scope="col">Кадастровый номер здания</th>
            <th scope="col">Адрес здания</th>
            <th scope="col">Район города</th>
            <th scope="col">Площадь земельного участка</th>
            <th scope="col">Год постройки здания</th>
            <th scope="col">Материал стен здания</th>
            <th scope="col">Материал фундамента</th>
            <th scope="col">Примечания</th>
            <th scope="col">Износ в процентах</th>
            <th scope="col">Количество этажей в здании</th>
            <th scope="col">Расстояние от центра города</th>
            <th scope="col">Площадь квартир</th>
            <th scope="col">Фото здания</th>
            <th scope="col">Количество квартир в здании</th>
            <th scope="col">Наличие лифта</th>
            <th scope="col"></th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
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
            <td></td>
            <td>${building.flats?ifExists}</td>
            <td>${building.elevator?ifExists?string}</td>
            <td><a class="btn btn-secondary btn-lg active" role="button" aria-pressed="true"
                   href="/building/edit/${building.kadastr}">Изменить</a></td>
            <td><a class="btn btn-secondary btn-lg active" role="button" aria-pressed="true"
                   href="/building/delete/${building.kadastr}">Удалить</a></td>
        </tr>
        </#list>
        </tbody>
    </table>
</div>
</@c.page>