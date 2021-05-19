<!DOCTYPE html>
<html>
<head>

</head>
<body>
    <form method="post" action="/login">
        <input type="text" name="login" placeholder="login">
        <input type="password" name="password" placeholder="password">
        <input type="submit" value="submit">
    </form>
    <#if redirectedFromCart??>
        <p>${redirectedFromCart}</p>
    </#if>
    <#if noLoginFoundMessage??>
        <p>${noLoginFoundMessage}</p>
    </#if>
    <#if wrongPasswordMessage??>
        <p>${wrongPasswordMessage}</p>
    </#if>
    <#if newlyRegistered??>
        <p>${newlyRegistered}</p>
    </#if>
</body>
</html>