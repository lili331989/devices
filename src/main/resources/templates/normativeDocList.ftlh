<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">
<@c.page>
<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Добавление нормативного документа</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="/normativeDoc/add" id="modal-details">
                    <div class="form-group row">
                        <label  class="col-sm-6 col-form-label">Номер нормативного документа</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="normativeDocNum" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-6 col-form-label">Наименование нормативного документа</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="normativeDocName" required>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-6 col-form-label">Область применения</label>
                        <div class="col-sm-10">
                            <select id="selectApplicationArea" name="selectApplicationArea">
                                <#if applicationList??>
                                <#list applicationList as application>
                                <option value="${application.id}">${application.applicationAreaName}</option>
                                </#list>
                                </#if>
                           </select>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-6 col-form-label">Тип нормативного документа</label>
                        <div class="col-sm-10">
                            <select id="selectTypeNormaDoc" name="selectTypeNormaDoc">
                                <#if typeList??>
                                <#list typeList as type>
                                <option value="${type.id}">${type.typeNormaName}</option>
                                 </#list>
                                 </#if>
                            </select>
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

<h4 align="center" >Нормативные документы</h4>
<div class="form-group row">
    <div class="col-sm-2">
        <input class="form-control" type="text" placeholder="Поиск" id="search-text" onkeyup="tableSearch()">
    </div>
    <div class="col-sm-10">
        <button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#staticBackdrop">
            Добавить нормативный документ
        </button>
    </div>
</div>

<table class="table table-striped" id="info-table">
    <thead class="thead-dark">
    <tr>
        <th scope="col">Номер нормативного документа</th>
        <th scope="col">Наименование нормативного документа</th>
        <th scope="col">Область применения</th>
        <th scope="col">Тип нормативного документа</th>
        <#if isAdmin>
            <th scope="col">User create</th>
            <th scope="col">Date create</th>
            <th scope="col">User update</th>
            <th scope="col">Date update</th>
        </#if>
        <th scope="col"> </th>
        <th scope="col"> </th>
    </tr>
    </thead>
    <tbody>
    <#list normativeList as normative>
    <tr>
        <td>${normative.normativeNum}</td>
        <td>${normative.normativeName}</td>
        <td>${normative.getApplicationAreaName()!}</td>
        <td>${normative.getTypeNormaDocName()!}</td>
        <#if isAdmin>
            <td>${(normative.userCreate.username)!}</td>
            <td>${normative.dateCreate!}</td>
            <td>${(normative.userUpdate.username)!}</td>
            <td>${normative.dateUpdate!}</td>
        </#if>
        <td> <a href="/normativeDoc/edit/${normative.id}">&#10000;</a></td>
        <td> <a href="/normativeDoc/delete/${normative.id}">&#9984;</a> </td>
    </tr>
    </#list>
    </tbody>
</table>
</@c.page>
<script src="/static/filter.js"></script>