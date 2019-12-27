<#import "parts/common.ftl" as c>

<@c.page>
    <#if building??>
        <form method="post" enctype="multipart/form-data" action="/building/save">
            <table>
                <tr><td>Кадастровый номер здания</td><td><input type="text" name="kadastr" size="20" maxlength="20" value="${building.kadastr}" contenteditable="false"/></td></tr>
                <tr><td>Адрес здания</td><td><input type="text" name="address" size="60" maxlength="60" value="${building.address?ifExists}"/></td></tr>
                <tr><td>Район города</td><td><input type="text" name="district" size="15" maxlength="15" value="${building.district?ifExists}"/></td></tr>
                <tr><td>Площадь земельного участка. Метры</td><td><input type="number" name="land" size="12" step="0.01" min="0.01" max="999999999999" value="${building.land?ifExists?string?replace(',','.')}"/></td></tr>
                <tr><td>Год постройки здания</td><td><input type="number" name="constructionYear" size="4" step="1" min="1" max="9999" value="${building.constructionYear?ifExists}"/></td></tr>
                <tr><td>Материал стен здания</td><td><input type="text" name="material" size="15" maxlength="15" value="${building.material?ifExists}"/></td></tr>
                <tr><td>Материал фундамента</td><td><input type="text" name="base" size="15" maxlength="15" value="${building.base?ifExists}"/></td></tr>
                <tr><td>Примечания</td><td><input type="text" name="comment" value="${building.comment?ifExists}"/></td></tr>
                <tr><td>Износ в процентах</td><td><input type="number" name="wear" size="4" step="1" min="1" max="100" value="${building.wear?ifExists}"/></td></tr>
                <tr><td>Количество этажей в здании</td><td><input type="number" name="flow" size="3" step="1" min="1" max="999" value="${building.flow?ifExists}"/></td></tr>
                <tr><td>Расстояние от центра города. Метры</td><td><input type="number" name="line" size="5" step="1" min="0" max="99999" value="${building.line?ifExists}"/></td></tr>
                <tr><td>Площадь квартир. Метры</td><td><input type="number" name="square" size="12" step="0.01" min="0.01" max="999999999999" value="${building.square?ifExists?string?replace(',','.')}"/></td></tr>
                <tr><td>Количество квартир в здании</td><td><input type="number" name="flats" size="3" step="1" min="1" max="999" value="${building.flats?ifExists}"/></td></tr>
                <tr><td>Наличие лифта</td><td>Да<input type="radio" name="elevator" value="true" <#if building.elevator == true>checked</#if>/> Нет<input type="radio" name="elevator" value="false" <#if building.elevator == false>checked</#if>/></td></tr>
                <tr><td>Фото</td><td><input type="file" name="picture"/></td></tr>
            </table>
            <button type="submit">Отправить</button>
        </form>
    <#else>
        <form method="post" enctype="multipart/form-data" action="/building/save">
            <table>
                <tr><td>Кадастровый номер здания</td><td><input type="text" name="kadastr" size="20" maxlength="20"/></td></tr>
                <tr><td>Адрес здания</td><td><input type="text" name="address" size="60" maxlength="60"/></td></tr>
                <tr><td>Район города</td><td><input type="text" name="district" size="15" maxlength="15"/></td></tr>
                <tr><td>Площадь земельного участка. Метры</td><td><input type="number" name="land" size="12" step="0.01" min="0.01"/></td></tr>
                <tr><td>Год постройки здания</td><td><input type="number" name="constructionYear" size="4" step="1" min="1" max="9999"/></td></tr>
                <tr><td>Материал стен здания</td><td><input type="text" name="material" size="15" maxlength="15"/></td></tr>
                <tr><td>Материал фундамента</td><td><input type="text" name="base" size="15" maxlength="15"/></td></tr>
                <tr><td>Примечания</td><td><input type="text" name="comment"/></td></tr>
                <tr><td>Износ в процентах</td><td><input type="number" name="wear" size="4" step="1" min="1" max="100"/></td></tr>
                <tr><td>Количество этажей в здании</td><td><input type="number" name="flow" size="3" step="1" min="1" max="999"/></td></tr>
                <tr><td>Расстояние от центра города. Метры</td><td><input type="number" name="line" size="5" step="1" min="0" max="99999"/></td></tr>
                <tr><td>Площадь квартир. Метры</td><td><input type="number" name="square" size="12" step="0.01" min="0.01" max="999999999999"/></td></tr>
                <tr><td>Количество квартир в здании</td><td><input type="number" name="flats" size="3" step="1" min="1" max="999"/></td></tr>
                <tr><td>Наличие лифта</td><td>Да<input type="radio" name="elevator" value="true"/> Нет<input type="radio" name="elevator" value="false" checked/></td></tr>
                <tr><td>Фото</td><td><input type="file" name="picture"/></td></tr>
            </table>
            <button type="submit">Отправить</button>
        </form>
        </#if>
</@c.page>