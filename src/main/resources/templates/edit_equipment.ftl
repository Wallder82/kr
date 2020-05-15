<#import "parts/common.ftl" as c>

<@c.page>
<div class="container mt-5">
    <br>
    <h2 >Оборудование</h2>
    <br>
    <#if equipment??>
    <form method="post" enctype="multipart/form-data" action="/equipment/save">
        <div class="form-group row">
            <label for="id" class="col-sm-3 col-form-label">Идентификатор</label>
            <div class="col-sm-2">
                <input class="form-control" type="number" id="id" name="id" size="4" step="1" min="1" max="9999" value="${equipment.id?ifExists}" readonly/>
            </div>
        </div>

        <div class="form-group row">
            <label for="name" class="col-sm-3 col-form-label">Название</label>
            <div class="col-sm-6">
                <input class="form-control" type="text" id="name" name="name" size="40" maxlength="100" value="${equipment.name?ifExists}"/>
            </div>
        </div>

        <div class="form-group row">
            <label for="count" class="col-sm-3 col-form-label">Количество</label>
            <div class="col-sm-2">
                <input class="form-control" type="number" id="count" name="count" size="3" step="1" min="1" max="999999999" value="${equipment.count?ifExists}"/>
            </div>
        </div>

        <div class="form-group">
            <label for="description">Описание</label>
            <textarea class="form-control" id="description" name="description" rows="3" maxlength="512" >${equipment.description?ifExists}</textarea>
        </div>

        <div class="form-group row">
            <div class="col-sm-3">
                <button type="submit" class="btn btn-primary">Сохранить</button>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    </form>

    <#else>

    <form method="post" enctype="multipart/form-data" action="/equipment/save">
        <div class="form-group row">
            <label for="name" class="col-sm-3 col-form-label">Название</label>
            <div class="col-sm-6">
                <input class="form-control" type="text" id="name" name="name" size="40" maxlength="100"/>
            </div>
        </div>

        <div class="form-group row">
            <label for="count" class="col-sm-3 col-form-label">Количество</label>
            <div class="col-sm-2">
                <input class="form-control" type="number" id="count" name="count" size="3" step="1" min="1" max="999999999"/>
            </div>
        </div>

        <div class="form-group">
            <label for="description">Описание</label>
            <textarea class="form-control" id="description" name="description" rows="3" maxlength="512"></textarea>
        </div>

        <div class="form-group row">
            <div class="col-sm-3">
                <button type="submit" class="btn btn-primary">Сохранить</button>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    </form>
</#if>
</div>
</@c.page>