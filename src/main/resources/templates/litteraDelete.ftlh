<#import "parts/common.ftlh" as c>

<@c.page>
<form action="/littera/delete" method="post">
    <p>Вы действительно хотите удалить Литеру? </p>
    <div> ${littera.litteraName}</div>
    <input type="hidden" name="litteraId" value="${littera.id}">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button type="submit" class="btn btn-primary">Удалить</button>
</form>
</@c.page>