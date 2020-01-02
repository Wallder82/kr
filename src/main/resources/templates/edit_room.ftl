<#import "parts/common.ftl" as c>

<@c.page>
<div class="container mt-5">
<#if room??>
<form method="post" enctype="multipart/form-data" action="/room/save">
    <div class="form-group row">
        <label for="id" class="col-sm-3 col-form-label">Идентификатор</label>
        <div class="col-sm-2">
            <input class="form-control" type="number" id="id" name="id" size="4" step="1" min="1" max="9999" value="${room.id?ifExists}" readonly/>
        </div>
    </div>
    <div class="form-group row">
        <label for="record" class="col-sm-3 col-form-label">Номер помещения в квартире</label>
        <div class="col-sm-2">
            <input class="form-control" type="number" id="record" name="record" size="3" step="1" min="1" max="999" value="${room.record?ifExists}"/>
        </div>
    </div>
    <div class="form-group row">
        <label for="squareRoom" class="col-sm-3 col-form-label">Площадь помещения</label>
        <div class="col-sm-2">
            <input class="form-control" type="number" id="squareRoom" name="squareRoom" size="12" step="0.01" min="0.01" max="999999999999" value="${room.squareRoom?ifExists?string?replace(',','.')}"/>
        </div>
    </div>
    <div class="form-group row">
        <label for="size" class="col-sm-3 col-form-label">Размеры помещения  в плане</label>
        <div class="col-sm-6">
            <input class="form-control" type="text" id="size" name="size" size="40" maxlength="40" value="${room.size?ifExists}"/>
        </div>
    </div>
    <div class="form-group row">
        <label for="name" class="col-sm-3 col-form-label">Назначение (кухня, ниша …)</label>
        <div class="col-sm-6">
            <input class="form-control" type="text" id="name" name="name" size="30" maxlength="40" value="${room.name?ifExists}"/>
        </div>
    </div>
    <div class="form-group row">
        <label for="decoration" class="col-sm-3 col-form-label">Отделка (паркет, обои …)</label>
        <div class="col-sm-6">
            <input class="form-control" type="text" id="decoration" name="decoration" size="60" maxlength="40" value="${room.decoration?ifExists}"/>
        </div>
    </div>
    <div class="form-group row">
        <label for="heightRoom" class="col-sm-3 col-form-label">Высота помещения</label>
        <div class="col-sm-2">
            <input class="form-control" type="number" id="heightRoom" name="heightRoom" size="12" step="0.01" min="0.01" max="999999999999" value="${room.heightRoom?ifExists?string?replace(',','.')}"/>
        </div>
    </div>
    <div class="form-group row">
        <label for="socket" class="col-sm-3 col-form-label">Число розеток в помещении</label>
        <div class="col-sm-2">
            <input class="form-control" type="number" id="socket" name="socket" size="2" step="1" min="0" max="99" value="${room.socket?ifExists}"/>
        </div>
    </div>
    <div class="form-group row">
        <label for="sections" class="col-sm-3 col-form-label">Число элементов в батарее отопления</label>
        <div class="col-sm-2">
            <input class="form-control" type="number" id="sections" name="sections" size="2" step="1" min="0" max="99" value="${room.sections?ifExists}"/>
        </div>
    </div>
    <div class="form-group row">
        <label for="houseroom" class="col-sm-3 col-form-label">Id квартиры</label>
        <div class="col-sm-2">
            <input class="form-control" type="number" id="houseroom" name="houseroom" size="4" step="1" min="1" max="9999" value="${room.houseroom.id?ifExists}" readonly/>
        </div>
    </div>

    <div class="form-group row">
        <div class="col-sm-3">
            <button type="submit" class="btn btn-primary">Сохранить</button>
        </div>
    </div>
</form>
<#else>
<form method="post" enctype="multipart/form-data" action="/room/save">
    <div class="form-group row">
        <label for="new_record" class="col-sm-3 col-form-label">Номер помещения в квартире</label>
        <div class="col-sm-2">
            <input class="form-control" type="number" id="new_record" name="record" size="3" step="1" min="1" max="999"/>
        </div>
    </div>
    <div class="form-group row">
        <label for="new_squareRoom" class="col-sm-3 col-form-label">Площадь помещения</label>
        <div class="col-sm-2">
            <input class="form-control" type="number" id="new_squareRoom" name="squareRoom" size="12" step="0.01" min="0.01" max="999999999999"/>
        </div>
    </div>
    <div class="form-group row">
        <label for="new_size" class="col-sm-3 col-form-label">Размеры помещения  в плане</label>
        <div class="col-sm-6">
            <input class="form-control" type="text" id="new_size" name="size" size="40" maxlength="40"/>
        </div>
    </div>
    <div class="form-group row">
        <label for="new_name" class="col-sm-3 col-form-label">Назначение (кухня, ниша …)</label>
        <div class="col-sm-6">
            <input class="form-control" type="text" id="new_name" name="name" size="30" maxlength="40"/>
        </div>
    </div>
    <div class="form-group row">
        <label for="new_decoration" class="col-sm-3 col-form-label">Отделка (паркет, обои …)</label>
        <div class="col-sm-6">
            <input class="form-control" type="text" id="new_decoration" name="decoration" size="60" maxlength="40"/>
        </div>
    </div>
    <div class="form-group row">
        <label for="new_heightRoom" class="col-sm-3 col-form-label">Высота помещения</label>
        <div class="col-sm-2">
            <input class="form-control" type="number" id="new_heightRoom" name="heightRoom" size="12" step="0.01" min="0.01" max="999999999999"/>
        </div>
    </div>
    <div class="form-group row">
        <label for="new_socket" class="col-sm-3 col-form-label">Число розеток в помещении</label>
        <div class="col-sm-2">
            <input class="form-control" type="number" id="new_socket" name="socket" size="2" step="1" min="0" max="99"/>
        </div>
    </div>
    <div class="form-group row">
        <label for="new_sections" class="col-sm-3 col-form-label">Число элементов в батарее отопления</label>
        <div class="col-sm-2">
            <input class="form-control" type="number" id="new_sections" name="sections" size="2" step="1" min="0" max="99"/>
        </div>
    </div>

    <div class="form-group row">
        <label for="new_houseroom" class="col-sm-3 col-form-label">Квартира</label>
        <div class="col-sm-3">
            <select class="form-control" name="houseroom" id="new_houseroom">
                <#list houseroom_list as houseroom>
                    <option value="${houseroom.id?ifExists}">${houseroom.id?ifExists}&nbsp;Кв:${houseroom.flat?ifExists}&nbsp;${houseroom.building.address?ifExists}</option>
                </#list>
            </select>
        </div>
    </div>

    <div class="form-group row">
        <div class="col-sm-3">
            <button type="submit" class="btn btn-primary">Сохранить</button>
        </div>
    </div>
</form>
</#if>
</div>
</@c.page>