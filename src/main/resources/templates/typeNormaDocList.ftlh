<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">
<@c.page>
<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Добавление типа нормативного документа</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="/typeNormaDoc/add" id="modal-details">
                    <div class="form-group row">
                        <label  class="col-sm-6 col-form-label">Название типа</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="typeNormaname" required>
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

<h4 align="center" >Тип нормативного документа</h4>
<div class="form-group row">
    <div class="col-sm-2">
        <input class="form-control" type="text" placeholder="Поиск" id="search-text" onkeyup="tableSearch()">
    </div>
    <div class="col-sm-10">
        <button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#staticBackdrop">
            Добавить тип нормативного документа
        </button>
    </div>
</div>

<table class="table table-striped" id="info-table">
    <thead class="thead-dark">
    <tr>
        <th scope="col">Наименование типа</th>
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
    <#list typeList as typeNormaDoc>
    <tr>
        <td>${typeNormaDoc.typeNormaName}</td>
        <#if isAdmin>
            <td>${(typeNormaDoc.userCreate.username)!}</td>
            <td>${typeNormaDoc.dateCreate!}</td>
            <td>${(typeNormaDoc.userUpdate.username)!}</td>
            <td>${typeNormaDoc.dateUpdate!}</td>
            <td> <a href="/typeNormaDoc/edit/${typeNormaDoc.id}">&#10000;</a></td>
            <td> <a href="/typeNormaDoc/delete/${typeNormaDoc.id}">&#9984;</a></td>
        </#if>
    </tr>
    </#list>
    </tbody>
</table>
</@c.page>
<script src="/static/filter.js"></script>