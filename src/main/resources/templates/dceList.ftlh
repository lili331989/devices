<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">
<@c.page>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Добавление ДСЕ</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="/dce/add" id="modal-details">
                    <div class="form-group row">
                        <label  class="col-sm-6 col-form-label">Номер ДСЕ</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="dcenum" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-6 col-form-label">Наименование ДСЕ</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="dcename" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label  class="col-sm-6 col-form-label">Масса ДСЕ</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="dcemass" pattern="\d{0,9}(.\d{0,3})?" title="число не более 3-х цифр после точки">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-6 col-form-label">Литера</label>
                        <div class="col-sm-10">
                            <select id="selectLittera" name="selectLittera">
                                <#if litteraList??>
                                    <#list litteraList as littera >
                                        <option value="${littera.id}">${littera.litteraName}</option>
                                    </#list>
                                </#if>
                             </select>
                        </div>
                    </div>
                    <div class="form-group row">
                         <label class="col-sm-6 col-form-label">Прибор</label>
                         <div class="col-sm-10">
                              <select id="selectDevice" name="selectDevice">
                                   <#if devices??>
                                      <#list devices as device >
                                         <option value="${device.id}">${device.deviceNum}</option>
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

<h4 align="center" >ДСЕ</h4>
<div class="form-group row">
    <div class="col-sm-2">
        <input class="form-control" type="text" placeholder="Поиск" id="search-text" onkeyup="tableSearch()">
    </div>
    <div class="col-sm-10">
        <button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#staticBackdrop">
            Добавить ДСЕ
        </button>
    </div>
</div>
<table class="table table-striped" id="info-table">
    <thead class="thead-dark">
    <tr>
        <th scope="col">Номер ДСЕ</th>
        <th scope="col">Наименование ДСЕ</th>
        <th scope="col">Литера</th>
        <th scope="col">Масса</th>
        <th scope="col">Прибор</th>
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
    <#list dces as dce>
    <tr>
        <td>${dce.dceNum}</td>
        <td>${dce.dceName}</td>
        <td>${(dce.getLitteraName())!}</td>
        <td>${(dce.dceMass)!}</td>
        <td>${(dce.getDeviceNumber())!}</td>
        <#if isAdmin>
            <td>${(dce.userCreate.username)!}</td>
            <td>${(dce.dateCreate)!}</td>
            <td>${(dce.userUpdate.username)!}</td>
            <td>${(dce.dateUpdate)!}</td>
        </#if>
        <td> <a href="/dce/edit/${dce.id}">&#10000;</a></td>
        <td> <a href="/dce/delete/${dce.id}">&#9984;</a></td>
    </tr>
    </#list>
    </tbody>
</table>
</@c.page>
<script src="/static/filter.js"></script>

