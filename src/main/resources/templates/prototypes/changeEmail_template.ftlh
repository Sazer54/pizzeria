<!DOCTYPE html>
<html>
<head></head>
<body>
<h1>Your email: ${currentUser.email}</h1>
<form method="post" action="/myprofile/change/email">
    <input type="text" name="email" placeholder="Email">
    <button>Submit</button>
</form>
</body>
</html>