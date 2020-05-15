<#import "parts/common.ftl" as c>

<@c.page>
<div class="container mt-5">
    <br>
    <h2 >Редактирвоание пользователя</h2>
    <br>
    <form method="post" enctype="multipart/form-data" action="/user/save">

        <div class="form-group row">
            <label for="id" class="col-sm-3 col-form-label">Идентификатор</label>
            <div class="col-sm-2">
                <input class="form-control" type="number" id="id" name="id" size="4" step="1" min="1" max="9999" value="${user.id}" readonly/>
            </div>
        </div>

        <div class="form-group row">
            <label for="username" class="col-sm-3 col-form-label">Логин</label>
            <div class="col-sm-2">
                <input class="form-control" type="text" id="username" name="username" size="40" maxlength="40" value="${user.username}"/>
            </div>
        </div>

        <fieldset class="form-group">
            <div class="row">
                <legend class="col-form-label col-sm-3 pt-0">Активен</legend>
                <div class="col-sm-15">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="active" id="new_twoLevel1" value="true" <#if user.active == true>checked</#if> />
                        <label class="form-check-label" for="new_twoLevel1">
                            Да
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="active" id="new_twoLevel2" value="false" <#if user.active == false>checked</#if> />
                        <label class="form-check-label" for="new_twoLevel2">
                            Нет
                        </label>
                    </div>
                </div>
            </div>
        </fieldset>

        <div class="form-group row">
            <label for="name" class="col-sm-3 col-form-label">Имя</label>
            <div class="col-sm-6">
                <input class="form-control" type="text" id="name" name="name" size="40" maxlength="80" value="${user.name}"/>
            </div>
        </div>

        <div class="form-group row">
            <label for="surname" class="col-sm-3 col-form-label">Фамилия</label>
            <div class="col-sm-6">
                <input class="form-control" type="text" id="surname" name="surname" size="30" maxlength="40" value="${user.surname}"/>
            </div>
        </div>

        <div class="form-group row">
            <label for="middleName" class="col-sm-3 col-form-label">Отчество</label>
            <div class="col-sm-6">
                <input class="form-control" type="text" id="middleName" name="middleName" size="60" maxlength="40" value="${user.middleName}"/>
            </div>
        </div>

        <div class="form-group row">
            <label for="level" class="col-sm-3 col-form-label">Level</label>
            <div class="col-sm-2">
                <input class="form-control" type="number" id="level" name="level" size="12" step="1" min="1" max="13" value="${user.level?string?replace(',','.')}"/>
            </div>
        </div>

            <#list roles as role>
        <div class="custom-control custom-switch">
            <input type="checkbox" class="custom-control-input" id = "${role}" name = "${role}" ${user.roles?seq_contains(role)?string("checked", "")}>
            <label class="custom-control-label" for="${role}">${role}</label>
        </div>
        </#list>

        <div class="form-group row">
            <div class="col-sm-3">
                <button type="submit" class="btn btn-primary">Сохранить</button>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    </form>
</div>
</@c.page>