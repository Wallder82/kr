<#import "parts/common.ftl" as c>

<@c.page>
<div class="container mt-5">
    <#if building??>
        <form method="post" enctype="multipart/form-data" action="/building/save">
            <div class="form-group row">
                <label for="kadastr" class="col-sm-3 col-form-label">Кадастровый номер здания</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="kadastr" id="kadastr" size="20" maxlength="20" value="${building.kadastr}" readonly/>
                </div>
            </div>
            <div class="form-group row">
                <label for="address" class="col-sm-3 col-form-label">Адрес здания</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="address" id="address" size="60" maxlength="60" value="${building.address?ifExists}"/>
                </div>
            </div>
            <div class="form-group row">
                <label for="district" class="col-sm-3 col-form-label">Район города</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="district" id="district" size="15" maxlength="15" value="${building.district?ifExists}"/>
                </div>
            </div>
            <div class="form-group row">
                <label for="land" class="col-sm-3 col-form-label">Площадь земельного участка. Метры</label>
                <div class="col-sm-2">
                    <input class="form-control" type="number" name="land" id="land" size="12" step="0.01" min="0.01" max="999999999999" value="${building.land?ifExists?string?replace(',','.')}"/>
                </div>
            </div>
            <div class="form-group row">
                <label for="constructionYear" class="col-sm-3 col-form-label">Год постройки здания</label>
                <div class="col-sm-2">
                    <input class="form-control" type="number" name="constructionYear" id="constructionYear" size="4" step="1" min="1" max="9999" value="${building.constructionYear?ifExists}"/>
                </div>
            </div>
            <div class="form-group row">
                <label for="material" class="col-sm-3 col-form-label">Материал стен здания</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="material" id="material" size="15" maxlength="15" value="${building.material?ifExists}"/>
                </div>
            </div>
            <div class="form-group row">
                <label for="base" class="col-sm-3 col-form-label">Материал фундамента</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="base" id="base" size="15" maxlength="15" value="${building.base?ifExists}"/>
                </div>
            </div>
            <div class="form-group row">
                <label for="comment" class="col-sm-3 col-form-label">Примечания</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="comment" id="comment" value="${building.comment?ifExists}"/>
                </div>
            </div>
            <div class="form-group row">
                <label for="wear" class="col-sm-3 col-form-label">Износ в процентах</label>
                <div class="col-sm-2">
                    <input class="form-control" type="number" name="wear" id="wear" size="4" step="1" min="1" max="100" value="${building.wear?ifExists}"/>
                </div>
            </div>
            <div class="form-group row">
                <label for="flow" class="col-sm-3 col-form-label">Количество этажей в здании</label>
                <div class="col-sm-2">
                    <input class="form-control" type="number" name="flow" id="flow" size="3" step="1" min="1" max="999" value="${building.flow?ifExists}"/>
                </div>
            </div>
            <div class="form-group row">
                <label for="line" class="col-sm-3 col-form-label">Расстояние от центра города. Метры</label>
                <div class="col-sm-2">
                    <input class="form-control" type="number" name="line" id="line" size="5" step="1" min="0" max="99999" value="${building.line?ifExists}"/>
                </div>
            </div>
            <div class="form-group row">
                <label for="square" class="col-sm-3 col-form-label">Площадь квартир. Метры</label>
                <div class="col-sm-2">
                    <input class="form-control" type="number" name="square" id="square" size="12" step="0.01" min="0.01" max="999999999999" value="${building.square?ifExists?string?replace(',','.')}"/>
                </div>
            </div>

            <fieldset class="form-group">
                <div class="row">
                    <legend class="col-form-label col-sm-3 pt-0">Наличие лифта</legend>
                    <div class="col-sm-15">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="elevator" id="new_twoLevel1" value="true" <#if building.elevator == true>checked</#if>/>
                            <label class="form-check-label" for="new_twoLevel1">
                                Да
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="elevator" id="new_twoLevel2" value="false" <#if building.elevator == false>checked</#if>/>
                            <label class="form-check-label" for="new_twoLevel2">
                                Нет
                            </label>
                        </div>
                    </div>
                </div>
            </fieldset>

            <div class="form-group">
                <label for="picture">Фото</label>
                <input type="file" class="form-control-file" id="picture" name="picture">
            </div>

            <input type="hidden" name="flats" value="${building.flats?ifExists}"/>

            <div class="form-group row">
                <div class="col-sm-3">
                    <button type="submit" class="btn btn-primary">Сохранить</button>
                </div>
            </div>
        </form>
    <#else>
        <form method="post" enctype="multipart/form-data" action="/building/save">
            <div class="form-group row">
                <label for="kadastr_new" class="col-sm-3 col-form-label">Кадастровый номер здания</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="kadastr" id="kadastr_new" size="20" maxlength="20"/>
                </div>
            </div>
            <div class="form-group row">
                <label for="address_new" class="col-sm-3 col-form-label">Адрес здания</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="address" id="address_new" size="60" maxlength="60"/>
                </div>
            </div>
            <div class="form-group row">
                <label for="district_new" class="col-sm-3 col-form-label">Район города</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="district" id="district_new" size="15" maxlength="15"/>
                </div>
            </div>
            <div class="form-group row">
                <label for="land_new" class="col-sm-3 col-form-label">Площадь земельного участка. Метры</label>
                <div class="col-sm-2">
                    <input class="form-control" type="number" name="land" id="land_new" size="12" step="0.01" min="0.01"/>
                </div>
            </div>
            <div class="form-group row">
                <label for="constructionYear_new" class="col-sm-3 col-form-label">Год постройки здания</label>
                <div class="col-sm-2">
                    <input class="form-control" type="number" name="constructionYear" id="constructionYear_new" size="4" step="1" min="1" max="9999"/>
                </div>
            </div>
            <div class="form-group row">
                <label for="material_new" class="col-sm-3 col-form-label">Материал стен здания</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="material" id="material_new" size="15" maxlength="15"/>
                </div>
            </div>
            <div class="form-group row">
                <label for="base_new" class="col-sm-3 col-form-label">Материал фундамента</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="base" id="base_new" size="15" maxlength="15"/>
                </div>
            </div>
            <div class="form-group row">
                <label for="comment_new" class="col-sm-3 col-form-label">Примечания</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="comment" id="comment_new"/>
                </div>
            </div>
            <div class="form-group row">
                <label for="wear_new" class="col-sm-3 col-form-label">Износ в процентах</label>
                <div class="col-sm-2">
                    <input class="form-control" type="number" name="wear" id="wear_new" size="4" step="1" min="1" max="100"/>
                </div>
            </div>
            <div class="form-group row">
                <label for="flow_new" class="col-sm-3 col-form-label">Количество этажей в здании</label>
                <div class="col-sm-2">
                    <input class="form-control" type="number" name="flow" id="flow_new" size="3" step="1" min="1" max="999"/>
                </div>
            </div>
            <div class="form-group row">
                <label for="line_new" class="col-sm-3 col-form-label">Расстояние от центра города. Метры</label>
                <div class="col-sm-2">
                    <input class="form-control" type="number" name="line" id="line_new" size="5" step="1" min="0" max="99999"/>
                </div>
            </div>
            <div class="form-group row">
                <label for="square_new" class="col-sm-3 col-form-label">Площадь квартир. Метры</label>
                <div class="col-sm-2">
                    <input class="form-control" type="number" name="square" id="square_new" size="12" step="0.01" min="0.01" max="999999999999"/>
                </div>
            </div>

            <fieldset class="form-group">
                <div class="row">
                    <legend class="col-form-label col-sm-3 pt-0">Наличие лифта</legend>
                    <div class="col-sm-15">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="elevator" id="new_twoLevel3" value="true"/>
                            <label class="form-check-label" for="new_twoLevel1">
                                Да
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="elevator" id="new_twoLevel4" value="false" checked/>
                            <label class="form-check-label" for="new_twoLevel2">
                                Нет
                            </label>
                        </div>
                    </div>
                </div>
            </fieldset>


            <div class="form-group">
                <label for="picture_new">Фото</label>
                <input type="file" class="form-control-file" id="picture_new" name="picture">
            </div>

            <input type="hidden" name="flats" value="0"/>

            <div class="form-group row">
                <div class="col-sm-3">
                    <button type="submit" class="btn btn-primary">Сохранить</button>
                </div>
            </div>
        </form>
        </#if>
</div>
</@c.page>