<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">
<@c.page>
<div class="container-fluid">
<br>
<h2 >Детали заявки</h2>
<br>
<h4>   Номер: ${application.id?ifExists}</h4>
<h4>   Дата создания: ${application.createTime?ifExists}</h4>
<h4>   Пользователь: ${application.user.surname?ifExists} ${application.user.name?ifExists} ${application.user.middleName?ifExists}</h4>
<h4>   Уровень: ${application.user.level?ifExists}</h4>
<br>
<form method="post" enctype="multipart/form-data" action="/application/save">
    <div class="form-group">
        <label for="description"><h4>Описание</h4></label>
        <textarea class="form-control" id="description" name="description" rows="3" maxlength="512" <#if application.status != "CREATED">disabled</#if> >${application.description?ifExists}</textarea>
    </div>
    <div class="form-group row">
        <div class="col-sm-3">
            <#if application.status == "CREATED">
                <button type="submit" class="btn btn-primary">Сохранить заявку</button>
            </#if>
            <a class="btn btn-danger" role="button" aria-pressed="true" href="/application/delete/${application.id}">Удалить заявку</a>
        </div>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <input type="hidden" name="application_id" value="${application.id}"/>
</form>

<#if application.status == "CREATED">
<form method="post" enctype="multipart/form-data" action="/camunda/complete/user_task">
    <button type="submit" class="btn btn-primary">Отправить в обработку</button>
    <input type="hidden" name="action" value="SENT"/>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <input type="hidden" name="application_id" value="${application.id}"/>
</form>
<#else>
    <#if isManager && application.status == "SENT">
        <form method="post" enctype="multipart/form-data" action="/camunda/complete/user_task">
            <button type="submit" class="btn btn-primary">Подтвердить</button>
            <input type="hidden" name="action" value="APPROVED"/>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <input type="hidden" name="application_id" value="${application.id}"/>
        </form>
        <form method="post" enctype="multipart/form-data" action="/camunda/complete/user_task">
            <button type="submit" class="btn btn-primary">Отклонить</button>
            <input type="hidden" name="action" value="APPROVED"/>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <input type="hidden" name="application_id" value="${application.id}"/>
        </form>
    </#if>
    <#if isAdmin && application.status == "APPROVED">
        <form method="post" enctype="multipart/form-data" action="/camunda/complete/user_task">
            <button type="submit" class="btn btn-primary">Подтвердить выполнение</button>
            <input type="hidden" name="action" value="COMPLETED"/>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <input type="hidden" name="application_id" value="${application.id}"/>
        </form>
    </#if>
</#if>

<br>
<br>
<#if application.rowList??>
<div class="container-fluid">
    <table class="table table-hover">
        <thead>
        <tr>
            <td>ID</td>
            <td>Название</td>
            <td>Описание</td>
            <td>Количество</td>
            <td></td>
            <td></td>
        </tr>
        </thead>
        <tbody>
        <#list application.rowList as row>
        <tr>
            <td>${row.id?ifExists}</td>
            <td>${row.equipment.name?ifExists}</td>
            <td>${row.equipment.description?ifExists}</td>
            <td>${row.count?ifExists}</td>
            <#if application.status == "CREATED">
            <td><a class="btn btn-secondary btn-lg active" role="button" aria-pressed="true"
                   href="/application/row/delete/${row.id}">Удалить</a></td>
            </#if>
        </tr>
        </#list>
        </tbody>
    </table>
</div>
</#if>

<#if application.status == "CREATED">
<div class="container-fluid mt-5">
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#rowModal" data-whatever="@mdo">Добавить новое оборудование в заявку</button>
</div>
<#else>
<a class="btn btn-danger" role="button" aria-pressed="true" href="/">Выйти</a>
</#if>

<div class="modal fade" id="rowModal" tabindex="-1" role="dialog" aria-labelledby="rowModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Новое оборудование</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" enctype="multipart/form-data" action="/application/row/add">

                    <div class="form-group">
                        <label for="equipment_id">Оборудование</label>
                        <select multiple class="form-control" id="equipment_id" name="equipment_id">
                            <#list equipment_list as equipment>
                                <option value="${equipment.id}">${equipment.name} ${equipment.description}</option>
                            </#list>
                        </select>
                    </div>

                    <div class="form-group row">
                        <label for="count" class="col-sm-3 col-form-label">Количество</label>
                        <div class="col-sm-2">
                            <input class="form-control" type="number" id="count" name="count" size="5" step="1" min="1" max="999999999"/>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-3">
                            <button type="submit" class="btn btn-primary">Сохранить</button>
                        </div>
                    </div>
                    <input type="hidden" name="application_id" value="${application.id}"/>
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                </form>
            </div>
        </div>
    </div>
</div>
</@c.page>