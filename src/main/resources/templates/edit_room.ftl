<#import "parts/common.ftl" as c>

<@c.page>
<#if room??>
<form method="post" enctype="multipart/form-data" action="/room/save">
    <table>
        <tr><td>Идентификатор</td><td><input type="number" name="id" size="4" step="1" min="1" max="9999" contenteditable="false" value="${room.id?ifExists}"/></td></tr>
        <tr><td>Номер помещения в квартире</td><td><input type="number" name="record" size="3" step="1" min="1" max="999" value=""/></td></tr>
        <tr><td>Площадь помещения</td><td><input type="number" name="squareRoom" size="12" step="0.01" min="0.01" max="999999999999" value=""/></td></tr>
        <tr><td>Размеры помещения  в плане</td><td><input type="text" name="size" size="40" maxlength="40" value=""/></td></tr>
        <tr><td>Назначение (кухня, ниша …)</td><td><input type="text" name="name" size="30" maxlength="40" value=""/></td></tr>
        <tr><td>Отделка (паркет, обои …)</td><td><input type="text" name="decoration" size="60" maxlength="40" value=""/></td></tr>
        <tr><td>Высота помещения</td><td><input type="number" name="heightRoom" size="12" step="0.01" min="0.01" max="999999999999" value=""/></td></tr>
        <tr><td>Число розеток в помещении</td><td><input type="number" name="socket" size="2" step="1" min="0" max="99" value=""/></td></tr>
        <tr><td>Число элементов в батарее отопления</td><td><input type="number" name="sections" size="2" step="1" min="0" max="99" value=""/></td></tr>
        <tr><td>Id квартиры</td><td><input type="number" name="id" size="4" step="1" min="1" max="9999" contenteditable="false" value="${room.houseroom.id?ifExists}"/></td></tr>
    </table>
    <button type="submit">Отправить</button>
</form>
<#else>
<form method="post" enctype="multipart/form-data" action="/room/save">
    <table>
        <tr><td>Номер помещения в квартире</td><td><input type="number" name="record" size="3" step="1" min="1" max="999"/></td></tr>
        <tr><td>Площадь помещения</td><td><input type="number" name="squareRoom" size="12" step="0.01" min="0.01" max="999999999999"/></td></tr>
        <tr><td>Размеры помещения  в плане</td><td><input type="text" name="size" size="40" maxlength="40"/></td></tr>
        <tr><td>Назначение (кухня, ниша …)</td><td><input type="text" name="name" size="30" maxlength="40"/></td></tr>
        <tr><td>Отделка (паркет, обои …)</td><td><input type="text" name="decoration" size="60" maxlength="40"/></td></tr>
        <tr><td>Высота помещения</td><td><input type="number" name="heightRoom" size="12" step="0.01" min="0.01" max="999999999999"/></td></tr>
        <tr><td>Число розеток в помещении</td><td><input type="number" name="socket" size="2" step="1" min="0" max="99"/></td></tr>
        <tr><td>Число элементов в батарее отопления</td><td><input type="number" name="sections" size="2" step="1" min="0" max="99"/></td></tr>
        <tr><td>Квартира</td>
            <td>
                <select name="houseroom">
                    <#list houseroom_list as houseroom>
                    <option value="${houseroom.id?ifExists}">${houseroom.id?ifExists}&nbsp;Кв:${houseroom.flat?ifExists}&nbsp;${houseroom.building.address?ifExists}</option>
                    </#list>
                </select>
            </td>
        </tr>
    </table>
    <button type="submit">Отправить</button>
</form>
</#if>
</@c.page>