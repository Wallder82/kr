<#import "parts/common.ftl" as c>

<@c.page>
<div>
    <form method="post">
        <input type="text" name="kadastr" size="20" maxlength="20" placeholder="Кадастровый номер здания"/>
        <input type="text" name="address" size="60" maxlength="60" placeholder="Адрес здания"/>
        <input type="text" name="district" size="15" maxlength="15" placeholder="Район города"/>
        <input type="number" name="land" size="12" step="0.01" min="0.01" placeholder="Площадь земельного участка. Метры"/>
        <input type="number" name="constructionYear" size="4" step="1" min="1" placeholder="Год постройки здания"/>
        <input type="text" name="material" size="15" maxlength="15" placeholder="Материал стен здания"/>
        <input type="text" name="base" size="15" maxlength="15" placeholder="Материал фундамента"/>
        <input type="text" name="comment" placeholder="Примечания"/>
        <input type="number" name="wear" size="4" step="1" min="1" max="100" placeholder="Износ в процентах"/>
        <input type="number" name="flow" size="3" step="1" min="1" max="999" placeholder="Количество этажей в здании"/>
        <input type="number" name="line" size="5" step="1" min="0" max="99999" placeholder="Расстояние от центра города. Метры"/>
        <input type="number" name="square" size="12" step="0.01" min="0.01" placeholder="Площадь квартир. Метры"/>Float square
        Integer flats
        Boolean elevator
</div>
</@c.page>