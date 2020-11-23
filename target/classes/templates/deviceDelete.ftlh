<#import "parts/common.ftlh" as c>

<@c.page>
<form action="/device/delete" method="post">
    <p>Вы действительно хотите удалить прибор? </p>
    <div>${device.deviceNum} ${device.deviceName}</div>
    <input type="hidden" name="deviceId" value="${device.id}">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button type="submit" class="btn btn-primary">Удалить</button>
</form>
</@c.page>