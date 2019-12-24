<#import "parts/common.ftl" as c>

<@c.page>
<div>
    <form method="post" enctype="multipart/form-data">
        <table>
            <tr><td>Кадастровый номер здания</td><td><input type="text" name="kadastr" size="20" maxlength="20"/></td></tr>
            <tr><td>Адрес здания</td><td><input type="text" name="address" size="60" maxlength="60"/></td></tr>
            <tr><td>Район города</td><td><input type="text" name="district" size="15" maxlength="15"/></td></tr>
            <tr><td>Площадь земельного участка. Метры</td><td><input type="number" name="land" size="12" step="0.01" min="0.01"/></td></tr>
            <tr><td>Год постройки здания</td><td><input type="number" name="constructionYear" size="4" step="1" min="1"/></td></tr>
            <tr><td>Материал стен здания</td><td><input type="text" name="material" size="15" maxlength="15"/></td></tr>
            <tr><td>Материал фундамента</td><td><input type="text" name="base" size="15" maxlength="15"/></td></tr>
            <tr><td>Примечания</td><td><input type="text" name="comment"/></td></tr>
            <tr><td>Износ в процентах</td><td><input type="number" name="wear" size="4" step="1" min="1" max="100"/></td></tr>
            <tr><td>Количество этажей в здании</td><td><input type="number" name="flow" size="3" step="1" min="1" max="999"/></td></tr>
            <tr><td>Расстояние от центра города. Метры</td><td><input type="number" name="line" size="5" step="1" min="0" max="99999"/></td></tr>
            <tr><td>Площадь квартир. Метры</td><td><input type="number" name="square" size="12" step="0.01" min="0.01"/></td></tr>
            <tr><td>Количество квартир в здании</td><td><input type="number" name="flats" size="3" step="1" min="1"/></td></tr>
            <tr><td>Наличие лифта</td><td><input type="checkbox" name="elevator"/></td></tr>
            <tr><td>Фото</td><td><input type="file" name="picture"/></td></tr>
        </table>
            <button type="submit">Отправить</button>
    </form>
</div>
</@c.page>