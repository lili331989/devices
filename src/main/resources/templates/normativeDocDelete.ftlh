<#import "parts/common.ftlh" as c>

<@c.page>
<form action="/normativeDoc/delete" method="post">
    <p>Вы действительно хотите удалить область применения? </p>
    <div> ${normativeDoc.normativeName}</div>
    <input type="hidden" name="normativeDocId" value="${normativeDoc.id}">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button type="submit" class="btn btn-primary">Удалить</button>
</form>
</@c.page>