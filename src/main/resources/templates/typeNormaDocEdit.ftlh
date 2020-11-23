<#import "parts/common.ftlh" as c>

<@c.page>
<p class="text-center" >Редактировать тип нормативной документации</p>

<form method="post" action="/typeNormaDoc/edit" id="modal-details">
    <div class="form-group row">
        <label class="col-sm-6 col-form-label">Наименование типа</label>
        <div class="col-sm-10">
            <input type="text" value="${typeNormaDoc.typeNormaName}" class="form-control" name="typeNormaname" required>
        </div>
    </div>

    <input type="hidden" name="typeNormaDocId" value="${typeNormaDoc.id}">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button type="submit" class="btn btn-primary" >Сохранить</button>
</form>

</@c.page>