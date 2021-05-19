<!DOCTYPE html>
<html>
<head>
    <title>Change your password</title>
    <link rel="icon" href="img/favicon.png">
</head>
<body>
<h1>Change your password</h1>
<form method="post" action="/myprofile/change/password" onsubmit="return validateForm()">
    <input type="text" id='password' name="password" placeholder="New password">
    <input type="text" id='passwordRepeated' name="passwordRepeated" placeholder="Repeat new password">
    <button>Submit</button>
</form>
<script>
    function validateForm() {
        var pass = document.getElementById('password').value
        var repeatedPass = document.getElementById('passwordRepeated').value
        if (pass != repeatedPass) {
            alert("passwords dont match");
            return false;
        } else {
            return true;
        }
    }
</script>
</body>
</html>