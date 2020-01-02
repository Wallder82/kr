<#import "parts/common.ftl" as c>

<@c.page>
<div class="container mt-5">
<#if houseroom??>
<form method="post" enctype="multipart/form-data" action="/houseroom/save">
    <div class="form-group row">
        <label for="id" class="col-sm-3 col-form-label">Идентификатор</label>
        <div class="col-sm-2">
            <input class="form-control" type="number" name="id" id="id" size="4" step="1" min="1" max="9999" value="${houseroom.id?ifExists}" readonly/>
        </div>
    </div>
    <div class="form-group row">
        <label for="flat" class="col-sm-3 col-form-label">Номер квартиры</label>
        <div class="col-sm-2">
            <input class="form-control" type="number" name="flat" id="flat" size="4" step="1" min="1" max="99" value="${houseroom.flat?ifExists}"/>
        </div>
    </div>
    <div class="form-group row">
        <label for="storey" class="col-sm-3 col-form-label">Номер этажа</label>
        <div class="col-sm-2">
            <input class="form-control" type="number" name="storey" id="storey" size="2" step="1" min="1" max="99" value="${houseroom.storey?ifExists}"/>
        </div>
    </div>

    <fieldset class="form-group">
        <div class="row">
            <legend class="col-form-label col-sm-3 pt-0">Квартира в двух уровнях</legend>
            <div class="col-sm-15">
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="twoLevel" id="new_twoLevel1" value="true" <#if houseroom.twoLevel == true>checked</#if> />
                    <label class="form-check-label" for="new_twoLevel1">
                        Да
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="twoLevel" id="new_twoLevel2" value="false" checked <#if houseroom.twoLevel == false>checked</#if> />
                    <label class="form-check-label" for="new_twoLevel2">
                        Нет
                    </label>
                </div>
            </div>
        </div>
    </fieldset>

    <div class="form-group row">
        <label for="squareFlat" class="col-sm-3 col-form-label">Общая площадь квартиры</label>
        <div class="col-sm-2">
            <input class="form-control" type="number" name="squareFlat" id="squareFlat" size="13" step="0.01" min="0.01" max="999999999999" value="${houseroom.squareFlat?ifExists?string?replace(',','.')}"/>
        </div>
    </div>
    <div class="form-group row">
        <label for="dwell" class="col-sm-3 col-form-label">Жилая площадь квартиры</label>
        <div class="col-sm-2">
            <input class="form-control" type="number" name="dwell" id="dwell" size="12" step="0.01" min="0.01" max="999999999999" value="${houseroom.dwell?ifExists?string?replace(',','.')}"/>
        </div>
    </div>
    <div class="form-group row">
        <label for="branch" class="col-sm-3 col-form-label">Вспомогательная площадь квартир</label>
        <div class="col-sm-2">
            <input class="form-control" type="number" name="branch" id="branch" size="13" step="0.01" min="0.01" max="999999999999" value="${houseroom.branch?ifExists?string?replace(',','.')}"/>
        </div>
    </div>
    <div class="form-group row">
        <label for="balcony" class="col-sm-3 col-form-label">Площадь балкона</label>
        <div class="col-sm-2">
            <input class="form-control" type="number" name="balcony" id="balcony" size="12" step="0.01" min="0.01" max="999999999999" value="${houseroom.balcony?ifExists?string?replace(',','.')}"/>
        </div>
    </div>
    <div class="form-group row">
        <label for="height" class="col-sm-3 col-form-label">Высота квартиры</label>
        <div class="col-sm-2">
            <input class="form-control" type="number" name="height" id="height" size="12" step="0.01" min="0.01" max="999999999999" value="${houseroom.height?ifExists?string?replace(',','.')}"/>
        </div>
    </div>
    <div class="form-group row">
        <label for="building" class="col-sm-3 col-form-label">Кадастровый номер здания</label>
        <div class="col-sm-2">
            <input class="form-control" type="text" name="building" id="building" size="20" maxlength="20" value="${houseroom.building.kadastr}" readonly/>
        </div>
    </div>

    <input type="hidden" name="rooms" id="rooms" value="${houseroom.rooms?ifExists}"/>

    <div class="form-group row">
        <div class="col-sm-2">
            <button type="submit" class="btn btn-primary">Сохранить</button>
        </div>
    </div>
</form>
<#else>
<form method="post" enctype="multipart/form-data" action="/houseroom/save">
    <div class="form-group row">
        <label for="new_flat" class="col-sm-3 col-form-label">Номер квартиры</label>
        <div class="col-sm-2">
            <input class="form-control" type="number" name="flat" id="new_flat" size="3" step="1" min="1" max="9999"/>
        </div>
    </div>
    <div class="form-group row">
        <label for="new_storey" class="col-sm-3 col-form-label">Номер этажа</label>
        <div class="col-sm-2">
            <input class="form-control" type="number" name="storey" id="new_storey" size="2" step="1" min="1" max="99"/>
        </div>
    </div>

    <fieldset class="form-group">
        <div class="row">
            <legend class="col-form-label col-sm-3 pt-0">Квартира в двух уровнях</legend>
            <div class="col-sm-15">
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="twoLevel" id="new_twoLevel3" value="true"/>
                    <label class="form-check-label" for="new_twoLevel1">
                        Да
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="twoLevel" id="new_twoLevel4" value="false" checked/>
                    <label class="form-check-label" for="new_twoLevel2">
                        Нет
                    </label>
                </div>
            </div>
        </div>
    </fieldset>

    <div class="form-group row">
        <label for="new_squareFlat" class="col-sm-3 col-form-label">Общая площадь квартиры</label>
        <div class="col-sm-2">
            <input class="form-control" type="number" name="squareFlat" id="new_squareFlat" size="13" step="0.01" min="0.01" max="999999999999"/>
        </div>
    </div>
    <div class="form-group row">
        <label for="new_dwell" class="col-sm-3 col-form-label">Жилая площадь квартиры</label>
        <div class="col-sm-2">
            <input class="form-control" type="number" name="dwell" id="new_dwell" size="12" step="0.01" min="0.01" max="999999999999"/>
        </div>
    </div>
    <div class="form-group row">
        <label for="new_branch" class="col-sm-3 col-form-label">Вспомогательная площадь квартиры</label>
        <div class="col-sm-2">
            <input class="form-control" type="number" name="branch" id="new_branch" size="12" step="0.01" min="0.01" max="999999999999"/>
        </div>
    </div>
    <div class="form-group row">
        <label for="new_balcony" class="col-sm-3 col-form-label">Площадь балкона</label>
        <div class="col-sm-2">
            <input class="form-control" type="number" name="balcony" id="new_balcony" size="12" step="0.01" min="0.01" max="999999999999"/>
        </div>
    </div>
    <div class="form-group row">
        <label for="new_height" class="col-sm-3 col-form-label">Высота квартиры</label>
        <div class="col-sm-2">
            <input class="form-control" type="number" name="height" id="new_height" size="12" step="0.01" min="0.01" max="999999999999"/>
        </div>
    </div>
    <div class="form-group row">
        <label for="new_building" class="col-sm-3 col-form-label">Кадастровый номер здания</label>
        <div class="col-sm-3">
            <select class="form-control" name="building" id="new_building">
                <#list building_list as building>
                <option value="${building.kadastr?ifExists}">${building.kadastr?ifExists}&nbsp;${building.address?ifExists}</option>
                </#list>
            </select>
        </div>
    </div>

    <input type="hidden" name="rooms" id="new_rooms" value="0"/>

    <div class="form-group row">
        <div class="col-sm-3">
            <button type="submit" class="btn btn-primary">Сохранить</button>
        </div>
    </div>
</form>
</#if>
</div>
</@c.page>