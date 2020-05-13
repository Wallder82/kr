<#assign
    known = Session.SPRING_SECURITY_CONTEXT??
>
<#if known>
    <#assign
        session_user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
        isAdmin = session_user.isAdmin()
        isManager = session_user.isManager()
    >
</#if>