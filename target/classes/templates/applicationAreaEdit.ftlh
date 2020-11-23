<#import "parts/common.ftlh" as c>

<@c.page>
<p class="text-center" >Редактировать Область применения</p>

<form method="post" action="/applicationArea/edit" id="modal-details">
    <div class="form-group row">
        <label class="col-sm-6 col-form-label">Наименование области применения</label>
        <div class="col-sm-10">
            <input type="text" value="${applicationArea.applicationAreaName}" class="form-control" name="applicationAreaname" required>
        </div>
    </div>

    <input type="hidden" name="applicationAreaId" value="${applicationArea.id}">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button type="submit" class="btn btn-primary" >Сохранить</button>
</form>

</@c.page>