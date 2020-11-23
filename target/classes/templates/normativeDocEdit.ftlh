<#import "parts/common.ftlh" as c>

<@c.page>
<p class="text-center" >Редактировать нормативный документ</p>

<form method="post" action="/normativeDoc/edit" id="modal-details">
    <div class="form-group row">
        <label class="col-sm-6 col-form-label">Номер нормативного документа</label>
        <div class="col-sm-10">
            <input type="text" value="${normativeDoc.normativeNum}" class="form-control" name="normativeDocNum" required>
        </div>
    </div>

    <div class="form-group row">
        <label class="col-sm-6 col-form-label">Наименование нормативного документа</label>
        <div class="col-sm-10">
            <input type="text" value="${normativeDoc.normativeName}" class="form-control" name="normativeDocName" required>
        </div>
    </div>

    <div class="form-group row">
        <label class="col-sm-6 col-form-label">Тип нормативного документа</label>
        <div class="col-sm-10">
            <select id="selectTypeNormaDoc" name="selectTypeNormaDoc">
                <#if typeList??>
                    <#list typeList as type>
                     <#if "${type.id}"="${normativeDoc.getTypeNormaDocId()}">
                            <option value="${type.id}" selected> ${type.typeNormaName}</option>
                     <#else>
                            <option value="${type.id}" > ${type.typeNormaName}</option>
                     </#if>
                    </#list>
                </#if>
            </select>
         </div>
    </div>

    <div class="form-group row">
        <label class="col-sm-6 col-form-label">Область применения</label>
        <div class="col-sm-10">
            <select id="selectApplicationArea" name="selectApplicationArea">
                <#if applicationList??>
                     <#list applicationList as application>
                     <#if "${application.id}"="${normativeDoc.getApplicationAreaId()}">
                        <option value="${application.id}" selected> ${application.applicationAreaName}</option>
                     <#else>
                        <option value="${application.id}" > ${application.applicationAreaName}</option>
                     </#if>
                    </#list>
                 </#if>
            </select>
        </div>
    </div>

    <input type="hidden" name="normativeDocId" value="${normativeDoc.id}">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button type="submit" class="btn btn-primary" >Сохранить</button>
</form>

</@c.page>