<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">
<@c.page>
<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Добавление нового пользователя</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="/user/add" id="modal-details">
                    <div class="form-group row">
                        <label  class="col-sm-2 col-form-label">Имя пользователя</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="username" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Пароль</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="userpassword" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label  class="col-sm-2 col-form-label">Фамилия</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="userlastname">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Имя</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="userfirstname">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Отчество</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="useradditionalname">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-10">
                            <label><input type="checkbox" name="useractive" >Активный </label>
                        </div>
                    </div>
                    <#list roles as role>
                      <div class="form-group row">
                        <div class="col-sm-10">
                            <label> <input type="checkbox" name="${role.name}" >${role.name}</label>
                        </div>
                      </div>
                     </#list>
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

<h4 align="center" >Пользователи</h4>
<div class="form-group row">
    <div class="col-sm-2">
        <input class="form-control" type="text" placeholder="Поиск" id="search-text" onkeyup="tableSearch()">
    </div>
    <div class="col-sm-10">
        <button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#staticBackdrop">
            Добавить пользователя
        </button>
    </div>
</div>

<table class="table table-striped" id="info-table">
    <thead class="thead-dark">
    <tr>
        <th scope="col">Пользователь</th>
        <th scope="col">Пароль</th>
        <th scope="col">Фамилия</th>
        <th scope="col">Имя</th>
        <th scope="col">Отчество</th>
        <th scope="col">Роль</th>
        <th scope="col">Активный</th>
        <th scope="col">User create</th>
        <th scope="col">Date create</th>
        <th scope="col">User update</th>
        <th scope="col">Date update</th>
        <th scope="col"> </th>
        <th scope="col"> </th>
    </tr>
    </thead>
    <tbody>
<#list users as user>
    <tr>
        <td>${user.username}</td>
        <td>${user.password}</td>
        <td>${user.lastname!}</td>
        <td>${user.firstname!}</td>
        <td>${user.additionalname!}</td>
        <td><#list user.roles as role>${role.name}<#sep>,  </#list></td>
        <td><input type="checkbox" ${user.active?string("checked", "")} disabled/> </td>
        <td>${(user.userCreate.username)!}</td>
        <td>${user.dateCreate!}</td>
        <td>${(user.userUpdate.username)!}</td>
        <td>${user.dateUpdate!}</td>
        <td><a href="/user/${user.id}">&#10000;</a></td>
        <td><a href="/user/delete/${user.id}">&#9984;</a></td>
    </tr>
 </#list>
    </tbody>
</table>
</@c.page>
<script src="/static/filter.js"></script>