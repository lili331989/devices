<#import "parts/common.ftlh" as c>

<@c.page>
<form action="/dce/delete" method="post">
    <p>Вы действительно хотите удалить ДСЕ? </p>
    <div>${dce.dceNum} ${dce.dceName}</div>
    <input type="hidden" name="dceId" value="${dce.id}">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button type="submit" class="btn btn-primary">Удалить</button>
</form>
</@c.page>