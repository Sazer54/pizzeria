<!DOCTYPE html>
<html>
    <head>

    </head>
<body>
    <p>Congrats, you have successfully placed your
        ${orderNumber}<#if orderNumber==1>st
            <#else>
            <#if orderNumber==2>nd
                <#else>
                <#if orderNumber==3>rd
                    <#else>th
                </#if>
            </#if>
        </#if>
        order!</p>
    <a href="/home">Go back to main page</a>
</body>
</html>