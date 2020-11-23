<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">
<@c.page>
<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Добавление прибора</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="/device/add" id="modal-details">
                    <div class="form-group row">
                        <label  class="col-sm-6 col-form-label">Номер прибора</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="devicenum" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-6 col-form-label">Наименование прибора</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="devicename" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label  class="col-sm-6 col-form-label">Масса прибора</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="devicemass" pattern="\d{0,9}(.\d{0,3})?" title="число не более 3-х цифр после точки">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label  class="col-sm-6 col-form-label">Высота прибора</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="deviceheight" pattern="\d{0,9}(.\d{0,3})?" title="число не более 3-х цифр после точки">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label  class="col-sm-6 col-form-label">Ширина прибора</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="devicewidth" pattern="\d{0,9}(.\d{0,3})?" title="число не более 3-х цифр после точки">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label  class="col-sm-6 col-form-label">Глубина прибора</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="devicedepth" pattern="\d{0,9}(.\d{0,3})?" title="число не более 3-х цифр после точки">
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


<h4 align="center" >Приборы</h4>
<div class="form-group row">
    <div class="col-sm-2">
        <input class="form-control" type="text" placeholder="Поиск" id="search-text" onkeyup="tableSearch()">
    </div>
    <div class="col-sm-10">
        <button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#staticBackdrop">
            Добавить прибор
        </button>
    </div>
</div>

<table class="table table-striped" id="info-table">
    <thead class="thead-dark">
    <tr>
        <th scope="col">Номер прибора</th>
        <th scope="col">Наименование прибора</th>
        <th scope="col">Масса</th>
        <th scope="col">Высота</th>
        <th scope="col">Глубина</th>
        <th scope="col">Ширина</th>
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
    <#list devices as device>
    <tr>
        <td>${device.deviceNum}</td>
        <td>${device.deviceName}</td>
        <td>${device.deviceMass!}</td>
        <td>${device.deviceHeight!}</td>
        <td>${device.deviceDepth!}</td>
        <td>${device.deviceWidth!}</td>
        <#if isAdmin>
            <td>${(device.userCreate.username)!}</td>
            <td>${device.dateCreate!}</td>
            <td>${(device.userUpdate.username)!}</td>
            <td>${device.dateUpdate!}</td>
        </#if>
        <td> <a href="/device/edit/${device.id}">&#10000;</a></td>
        <td> <a href="/device/delete/${device.id}">&#9984;</a> </td>
    </tr>
    </#list>
    </tbody>
</table>
</@c.page>
<script src="/static/filter.js"></script>