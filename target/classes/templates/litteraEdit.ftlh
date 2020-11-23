<#import "parts/common.ftlh" as c>

<@c.page>
<p class="text-center" >Редактировать Литеру</p>

<form method="post" action="/littera/edit" id="modal-details">
    <div class="form-group row">
        <label class="col-sm-6 col-form-label">Наименование Литеры</label>
        <div class="col-sm-10">
            <input type="text" value="${littera.litteraName}" class="form-control" name="litteraname" required>
        </div>
    </div>

    <input type="hidden" name="litteraId" value="${littera.id}">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button type="submit" class="btn btn-primary" >Сохранить</button>
</form>

</@c.page>