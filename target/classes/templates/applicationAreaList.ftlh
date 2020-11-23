<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">
<@c.page>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Добавление новой области применения</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="/applicationArea/add" id="modal-details">
                    <div class="form-group row">
                        <label  class="col-sm-6 col-form-label">Название области применения</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="applicationAreaname" required>
                        </div>
                    </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                </form>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary" form="modal-details">Сохранить</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Закрыть</button>
            </div>
        </div>
    </div>
</div>

<h4 align="center" >Область применения</h4>
<div class="form-group row">
    <div class="col-sm-2">
        <input class="form-control" type="text" placeholder="Поиск" id="search-text" onkeyup="tableSearch()">
    </div>
    <div class="col-sm-10">
        <button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#staticBackdrop">
            Добавить область применения
        </button>
    </div>
</div>

<table class="table table-striped" id="info-table">
    <thead class="thead-dark">
    <tr>
        <th scope="col">Наименование области применения</th>
        <#if isAdmin>
            <th scope="col">User create</th>
            <th scope="col">Date create</th>
            <th scope="col">User update</th>
            <th scope="col">Date update</th>
            <th scope="col"> </th>
            <th scope="col"> </th>
        </#if>
    </tr>
    </thead>
    <tbody>
    <#list applicationList as applicationArea>
    <tr>
        <td>${applicationArea.applicationAreaName}</td>
        <#if isAdmin>
            <td>${(applicationArea.userCreate.username)!}</td>
            <td>${(applicationArea.dateCreate)!}</td>
            <td>${(applicationArea.userUpdate.username)!}</td>
            <td>${(applicationArea.dateUpdate)!}</td>
            <td> <a href="/applicationArea/edit/${applicationArea.id}">&#10000;</a></td>
            <td> <a href="/applicationArea/delete/${applicationArea.id}">&#9984;</a></td>
        </#if>
    </tr>
    </#list>
    </tbody>
</table>
</@c.page>
<script src="/static/filter.js"></script>