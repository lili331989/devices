<#include "security.ftlh">
<#import "login.ftlh" as l>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/">Приборы</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto>
            <li class="nav-item">
                <a class="nav-link" href="/dce">ДСЕ</a>
            </li>
            <li class="nav-item">
                   <a class="nav-link" href="/device">Приборы</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/normativeDoc">Нормативные документы</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/dceNormativeDoc">Используемые нормативные документы в ДСЕ</a>
            </li>
            <li class="nav-item dropdown">
               <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Справочники
               </a>
               <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                   <a class="dropdown-item" href="/littera">Литера</a>
                   <a class="dropdown-item" href="/typeNormaDoc">Тип нормативной документации</a>
                   <a class="dropdown-item" href="/applicationArea">Область применения</a>
               </div>
             </li>
            <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-link" href="/user">Список пользователя</a>
                </li>
            </#if>

        </ul>
        <div class="navbar-text mr-3 ml-5">${name} </div>
              <#if name!="Гость"><@l.logout/></#if>

    </div>
</nav>
