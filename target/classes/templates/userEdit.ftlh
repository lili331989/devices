<#import "parts/common.ftlh" as c>

<@c.page>
<p class="text-center" >Редактировать пользователя</p>

<form action="/user" method="post">
    <div class="form-group row">
        <label  class="col-sm-2 col-form-label">Имя пользователя</label>
        <div class="col-sm-10">
            <input type="text"  value="${user.username}" class="form-control" name="username" required>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Пароль</label>
        <div class="col-sm-10">
            <input type="text"  value="${user.password}" class="form-control" name="userpassword" required>
        </div>
    </div>
    <div class="form-group row">
            <label  class="col-sm-2 col-form-label">Фамилия</label>
            <div class="col-sm-10">
                <input type="text" value="${user.lastname!}" class="form-control" name="userlastname">
            </div>
    </div>

    <div class="form-group row">
            <label class="col-sm-2 col-form-label">Имя</label>
            <div class="col-sm-10">
                <input type="text"  value="${user.firstname!}" class="form-control" name="userfirstname">
            </div>
    </div>
    <div class="form-group row">
            <label class="col-sm-2 col-form-label">Отчество</label>
            <div class="col-sm-10">
                <input type="text" value="${user.additionalname!}" class="form-control" name="useradditionalname">
            </div>
    </div>

    <div class="form-group row">
        <div class="col-sm-10">
            <label><input type="checkbox" name="useractive" ${user.active?string("checked","")}>Активный </label>
        </div>
    </div>
    <#list roles as role>
    <div class="form-group row">
        <div class="col-sm-10">
               <label> <input type="checkbox" name="${role.name}" ${user.roles?seq_contains(role)?string("checked", "")}>${role.name}</label>
        </div>
    </div>
    </#list>
    <input type="hidden" name="userId" value="${user.id}">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button type="submit" class="btn btn-primary" >Сохранить</button>
</form>

</@c.page>