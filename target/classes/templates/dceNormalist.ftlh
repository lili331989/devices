<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">
<@c.page>
<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Добавление ДСЕ-Нормативный окумент</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="/dceNormativeDoc/add" id="modal-details">

                    <div class="form-group row">
                        <label class="col-sm-6 col-form-label">ДСЕ</label>
                        <div class="col-sm-10">
                            <select id="selectDce" name="selectDce">
                                <#if dceList??>
                                    <#list dceList as dce>
                                        <option value="${dce.id}">${dce.dceNum}</option>
                                    </#list>
                                </#if>
                             </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-6 col-form-label">Нормативный документ</label>
                        <div class="col-sm-10">
                            <select id="selectNormativeDoc" name="selectNormativeDoc">
                                <#if normativeDocList??>
                                    <#list normativeDocList as norma >
                                        <option value="${norma.id}">${norma.normativeNum}</option>
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

<h4 align="center" >ДСЕ-Нормативные документы</h4>
<div class="form-group row">
    <div class="col-sm-2">
        <input class="form-control" type="text" placeholder="Поиск" id="search-text" onkeyup="tableSearch()">
    </div>
    <div class="col-sm-10">
        <button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#staticBackdrop">
            Добавить ДСЕ-Нормативные документы
        </button>
    </div>
</div>
<table class="table table-striped" id="info-table">
    <thead class="thead-dark">
    <tr>
        <th scope="col">Номер ДСЕ</th>
        <th scope="col">Номер нормативного документа</th>
        <#if isAdmin>
            <th scope="col">User create</th>
            <th scope="col">Date create</th>
            <th scope="col">User update</th>
            <th scope="col">Date update</th>
        </#if>
        <th scope="col"> </th>
    </tr>
    </thead>
    <tbody>
    <#list dceNormaList as dceNorma>
        <tr>
            <td>${dceNorma.dceNum()}</td>
            <td>${dceNorma.normativeNum()}</td>
            <#if isAdmin>
                <td>${(dceNorma.userCreate.username)!}</td>
                <td>${(dceNorma.dateCreate)!}</td>
                <td>${(dceNorma.userUpdate.username)!}</td>
                <td>${(dceNorma.dateUpdate)!}</td>
            </#if>
            <td> <a href="/dceNormativeDoc/delete/${dceNorma.id}">&#9984;</a></td>
        </tr>
    </#list>
    </tbody>
</table>
</@c.page>
<script src="/static/filter.js"></script>
