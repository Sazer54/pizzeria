<!DOCTYPE html>
<html>
<head></head>
<body>
<h1>Your phone: ${currentUser.phone}</h1>
<form method="post" action="/myprofile/change/phone">
    <input type="text" name="phone" placeholder="Phone">
    <button>Submit</button>
</form>
</body>
</html>