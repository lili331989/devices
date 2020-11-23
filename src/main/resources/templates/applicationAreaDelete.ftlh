<#import "parts/common.ftlh" as c>

<@c.page>
<form action="/applicationArea/delete" method="post">
    <p>Вы действительно хотите удалить область применения? </p>
    <div> ${applicationArea.applicationAreaName}</div>
    <input type="hidden" name="applicationAreaId" value="${applicationArea.id}">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button type="submit" class="btn btn-primary">Удалить</button>
</form>
</@c.page>