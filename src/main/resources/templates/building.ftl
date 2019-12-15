<#import "parts/common.ftl" as c>

<@c.page>
<div>
    <form method="post">
        <input type="text" name="kadastr" size="20" maxlength="20" placeholder="Кадастровый номер здания"/><br>
        <input type="text" name="address" size="60" maxlength="60" placeholder="Адрес здания"/><br>
        <input type="text" name="district" size="15" maxlength="15" placeholder="Район города"/><br>
        <input type="number" name="land" size="12" step="0.01" min="0.01" placeholder="Площадь земельного участка. Метры"/><br>
        <input type="number" name="constructionYear" size="4" step="1" min="1" placeholder="Год постройки здания"/><br>
        <input type="text" name="material" size="15" maxlength="15" placeholder="Материал стен здания"/><br>
        <input type="text" name="base" size="15" maxlength="15" placeholder="Материал фундамента"/><br>
        <input type="text" name="comment" placeholder="Примечания"/><br>
        <input type="number" name="wear" size="4" step="1" min="1" max="100" placeholder="Износ в процентах"/><br>
        <input type="number" name="flow" size="3" step="1" min="1" max="999" placeholder="Количество этажей в здании"/><br>
        <input type="number" name="line" size="5" step="1" min="0" max="99999" placeholder="Расстояние от центра города. Метры"/><br>
        <input type="number" name="square" size="12" step="0.01" min="0.01" placeholder="Площадь квартир. Метры"/><br>
        <input type="number" name="flats" size="3" step="1" min="1" placeholder="Количество квартир в здании"/><br>
        <input type="checkbox" name="elevator" placeholder="Наличие лифта"/><br>
        <input type="file" name="picture"/><br>
        <button type="submit">Отправить</button>
</div>
</@c.page>