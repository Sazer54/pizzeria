<!DOCTYPE html>
<html>
<head></head>
<body>
<h1>Your name: ${currentUser.firstName} ${currentUser.lastName}</h1>
<form method="post" action="/myprofile/change/name">
    <input type="text" name="firstName" placeholder="First name">
    <input type="text" name="lastName" placeholder="Last name"><br>
    <button>Submit</button>
</form>
</body>
</html>