<#import "parts/common.ftlh" as c>

<@c.page>
<form action="/user/delete" method="post">
    <p>Вы действительно хотите удалить пользователя? </p>
    <div>${user.username}</div>
    <div>${user.lastname} ${user.firstname} ${user.additionalname}</div>
    <input type="hidden" name="userId" value="${user.id}">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button type="submit" class="btn btn-primary">Удалить</button>
</form>
</@c.page>