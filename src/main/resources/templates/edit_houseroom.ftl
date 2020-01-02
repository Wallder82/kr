<#import "parts/common.ftl" as c>

<@c.page>
<#if houseroom??>
<form method="post" enctype="multipart/form-data" action="/houseroom/save">
    <table>
        <tr><td>Идентификатор</td><td><input type="number" name="id" size="4" step="1" min="1" max="9999" contenteditable="false" value="${houseroom.id?ifExists}"/></td></tr>
        <tr><td>Номер квартиры</td><td><input type="number" name="flat" size="4" step="1" min="1" max="99" value="${houseroom.flat?ifExists}"/></td></tr>
        <tr><td>Номер этажа</td><td><input type="number" name="storey" size="2" step="1" min="1" max="99" value="${houseroom.storey?ifExists}"/></td></tr>
        <tr><td>Квартира в двух уровнях</td><td>Да<input type="radio" name="twoLevel" value="true" <#if houseroom.twoLevel == true>checked</#if>/> Нет<input type="radio" name="twoLevel" value="false" <#if houseroom.twoLevel == false>checked</#if>/></td></tr>
        <tr><td>Общая площадь квартиры</td><td><input type="number" name="squareFlat" size="12" step="0.01" min="0.01" max="999999999999" value="${houseroom.squareFlat?ifExists?string?replace(',','.')}"/></td></tr>
        <tr><td>Жилая площадь квартиры</td><td><input type="number" name="dwell" size="12" step="0.01" min="0.01" max="999999999999" value="${houseroom.dwell?ifExists?string?replace(',','.')}"/></td></tr>
        <tr><td>Вспомогательная площадь квартиры</td><td><input type="number" name="branch" size="12" step="0.01" min="0.01" max="999999999999" value="${houseroom.branch?ifExists?string?replace(',','.')}"/></td></tr>
        <tr><td>Площадь балкона</td><td><input type="number" name="balcony" size="12" step="0.01" min="0.01" max="999999999999" value="${houseroom.balcony?ifExists?string?replace(',','.')}"/></td></tr>
        <tr><td>Высота квартиры</td><td><input type="number" name="height" size="12" step="0.01" min="0.01" max="999999999999" value="${houseroom.height?ifExists?string?replace(',','.')}"/></td></tr>
        <tr><td>Кадастровый номер здания</td><td><input type="text" name="building" size="20" maxlength="20" value="${houseroom.building.kadastr}" contenteditable="false"/></td></tr>
    </table>
    <button type="submit">Отправить</button>
</form>
<#else>
<form method="post" enctype="multipart/form-data" action="/houseroom/save">
    <table>
        <tr><td>Номер квартиры</td><td><input type="number" name="flat" size="4" step="1" min="1" max="9999"/></td></tr>
        <tr><td>Номер этажа</td><td><input type="number" name="storey" size="2" step="1" min="1" max="99"/></td></tr>
        <tr><td>Количество комнат</td><td><input type="hidden" name="rooms" value="0"/></td></tr>
        <tr><td>Квартира в двух уровнях</td><td>Да<input type="radio" name="twoLevel" value="true"/> Нет<input type="radio" name="twoLevel" value="false" checked/></td></tr>
        <tr><td>Общая площадь квартиры</td><td><input type="number" name="squareFlat" size="12" step="0.01" min="0.01" max="999999999999"/></td></tr>
        <tr><td>Жилая площадь квартиры</td><td><input type="number" name="dwell" size="12" step="0.01" min="0.01" max="999999999999"/></td></tr>
        <tr><td>Вспомогательная площадь квартиры</td><td><input type="number" name="branch" size="12" step="0.01" min="0.01" max="999999999999"/></td></tr>
        <tr><td>Площадь балкона</td><td><input type="number" name="balcony" size="12" step="0.01" min="0.01" max="999999999999"/></td></tr>
        <tr><td>Высота квартиры</td><td><input type="number" name="height" size="12" step="0.01" min="0.01" max="999999999999"/></td></tr>
        <tr><td>Кадастровый номер здания</td>
            <td>
                <select name="building">
                    <#list building_list as building>
                    <option value="${building.kadastr?ifExists}">${building.kadastr?ifExists}&nbsp;${building.address?ifExists}</option>
                    </#list>
                </select>
            </td>
        </tr>
    </table>
    <button type="submit">Отправить</button>
</form>
</#if>
</@c.page>