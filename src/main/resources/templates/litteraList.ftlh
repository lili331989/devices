<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">
<@c.page>
<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Добавление Литеры</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="/littera/add" id="modal-details">
                    <div class="form-group row">
                        <label  class="col-sm-6 col-form-label">Название литеры</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="litteraname" required>
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
<h4 align="center" >Литера</h4>
<div class="form-group row">
    <div class="col-sm-2">
        <input class="form-control" type="text" placeholder="Поиск" id="search-text" onkeyup="tableSearch()">
    </div>
    <div class="col-sm-10">
        <button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#staticBackdrop">
            Добавить литеру
        </button>
    </div>
</div>

<table class="table table-striped" id="info-table">
    <thead class="thead-dark">
    <tr>
        <th scope="col">Наименование Литеры</th>
        <#if isAdmin>
            <th scope="col">User create</th>
            <th scope="col">Date create</th>
            <th scope="col">User update</th>
            <th scope="col">Date update</th>
            <th colspan="2" scope="col"> </th>
        </#if>
    </tr>
    </thead>
    <tbody>
    <#list litteras as littera>
    <tr>
        <td>${littera.litteraName}</td>
        <#if isAdmin>
            <td>${(littera.userCreate.username)!}</td>
            <td>${littera.dateCreate!}</td>
            <td>${(littera.userUpdate.username)!}</td>
            <td>${littera.dateUpdate!}</td>
            <td> <a href="/littera/edit/${littera.id}">&#10000;</a></td>
            <td> <a href="/littera/delete/${littera.id}">&#9984;</a></td>
        </#if>
    </tr>
    </#list>
    </tbody>
</table>
</@c.page>

<script src="/static/filter.js"></script>