<#import "parts/common.ftlh" as c>

<@c.page>
<form action="/typeNormaDoc/delete" method="post">
    <p>Вы действительно хотите удалить данный тип нормативной документации? </p>
    <div> ${typeNormaDoc.typeNormaName}</div>
    <input type="hidden" name="typeNormaDocId" value="${typeNormaDoc.id}">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button type="submit" class="btn btn-primary">Удалить</button>
</form>
</@c.page>