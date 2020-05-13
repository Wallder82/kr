<#import "parts/common.ftl" as c>

<@c.page>
<h1>Отдел учета квартир БТИ</h1>
<form action="/logout" method="post">
    <input type="submit" value="Sign Out"/>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
</form>
</@c.page>