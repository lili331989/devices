<#import "parts/common.ftlh" as c>

<@c.page>
<form action="/dceNormativeDoc/delete" method="post">
    <p>Вы действительно хотите удалить ДСЕ-нормативный документ? </p>
    <div>${dceNorma.dceNum()} ${dceNorma.normativeNum()}</div>
    <input type="hidden" name="dceNormaId" value="${dceNorma.id}">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button type="submit" class="btn btn-primary">Удалить</button>
</form>
</@c.page>