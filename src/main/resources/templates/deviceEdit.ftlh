<#import "parts/common.ftlh" as c>

<@c.page>
<p class="text-center" >Редактировать прибор</p>

<form method="post" action="/device/edit" id="modal-details">
    <div class="form-group row">
        <label  class="col-sm-6 col-form-label">Номер прибора</label>
        <div class="col-sm-10">
            <input type="text" value="${device.deviceNum}" class="form-control" name="devicenum" required>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-6 col-form-label">Наименование прибора</label>
        <div class="col-sm-10">
            <input type="text" value="${device.deviceName}" class="form-control" name="devicename" required>
        </div>
    </div>
    <div class="form-group row">
        <label  class="col-sm-6 col-form-label">Масса прибора</label>
        <div class="col-sm-10">
            <input type="text"  value="${(device.deviceMass)!}" class="form-control" name="devicemass" pattern="\d{0,9}(.\d{0,3})?" title="число не более 3-х цифр после точки">
        </div>
    </div>
    <div class="form-group row">
        <label  class="col-sm-6 col-form-label">Глубина прибора</label>
        <div class="col-sm-10">
            <input type="text"  value="${(device.deviceDepth)!}" class="form-control" name="devicedepth" pattern="\d{0,9}(.\d{0,3})?" title="число не более 3-х цифр после точки">
        </div>
    </div>
    <div class="form-group row">
        <label  class="col-sm-6 col-form-label">Ширина прибора</label>
        <div class="col-sm-10">
            <input type="text"  value="${(device.deviceWidth)!}" class="form-control" name="devicewidth" pattern="\d{0,9}(.\d{0,3})?" title="число не более 3-х цифр после точки">
        </div>
    </div>
    <div class="form-group row">
        <label  class="col-sm-6 col-form-label">Высота прибора</label>
        <div class="col-sm-10">
            <input type="text"  value="${(device.deviceHeight)!}" class="form-control" name="deviceheight" pattern="\d{0,9}(.\d{0,3})?" title="число не более 3-х цифр после точки">
        </div>
    </div>

    <input type="hidden" name="deviceId" value="${device.id}">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button type="submit" class="btn btn-primary" >Сохранить</button>
</form>

</@c.page>