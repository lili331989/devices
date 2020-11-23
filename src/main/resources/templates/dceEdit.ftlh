<#import "parts/common.ftlh" as c>

<@c.page>
<p class="text-center" >Редактировать ДСЕ</p>

<form method="post" action="/dce/edit" id="modal-details">
    <div class="form-group row">
        <label  class="col-sm-6 col-form-label">Номер ДСЕ</label>
        <div class="col-sm-10">
            <input type="text" value="${dce.dceNum}" class="form-control" name="dcenum" required>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-6 col-form-label">Наименование ДСЕ</label>
        <div class="col-sm-10">
            <input type="text" value="${dce.dceName}" class="form-control" name="dcename" required>
        </div>
    </div>
    <div class="form-group row">
        <label  class="col-sm-6 col-form-label">Масса ДСЕ</label>
        <div class="col-sm-10">
            <input type="text"  value="${(dce.dceMass)!}" class="form-control" name="dcemass" pattern="\d{0,9}(.\d{0,3})?" title="число не более 3-х цифр после точки">
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-6 col-form-label">Литера</label>
        <div class="col-sm-10">
            <select id="selectLittera" name="selectLittera">
                <#if litteraList??>
                  <#list litteraList as littera >
                     <#if "${littera.litteraName}"="${dce.getLitteraName()}">
                         <option value="${littera.id}" selected> ${littera.litteraName}</option>
                     <#else>
                        <option value="${littera.id}" > ${littera.litteraName}</option>
                     </#if>
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
                       <#if "${device.deviceNum}"="${dce.getDeviceNumber()}">
                           <option value="${device.id}" selected>${device.deviceNum}</option>
                       <#else>
                            <option value="${device.id}" >${device.deviceNum}</option>
                      </#if>
                  </#list>
               </#if>
            </select>
        </div>
    </div>
    <input type="hidden" name="dceId" value="${dce.id}">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button type="submit" class="btn btn-primary" >Сохранить</button>
</form>

</@c.page>