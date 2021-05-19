<!DOCTYPE html>
<html>
<head></head>
<body>
<h1>Register a new account</h1>
<#if repeatedLogin??>
<p>Username taken</p>
</#if>
<form method="post" action="/register" onsubmit="return validateForm()">
    <input type="text" name="login" placeholder="Username"><br>
    <input type="text" name="firstName" placeholder="First Name">
    <input type="text" name="lastName" placeholder="Last Name"><br>
    <input type="text" name="phone" placeholder="Phone">
    <input type="text" name="email" placeholder="E-mail"><br>
    <input type="password" name="password" placeholder="Password">
    <input type="password" name="repeatPassword" placeholder="Repeat password">
    <input type="text" name="city" placeholder="City">
    <input type="text" name="postalCode" placeholder="Postal code">
    <input type="text" name="address" placeholder="Address">
    <button>Submit</button>
</form>
<script>
    function validateForm() {
        var login = document.getElementById('login').value
        var fName = document.getElementById('firstName').value
        var lName = document.getElementById('lastName').value
        var phone = document.getElementById('phone').value
        var email = document.getElementById('email').value
        var mailFormat = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
        // ADD PHONE VALIDATION
        // ADD ALL FIELDS REQUIRED, CUZ BELOW DOESN'T WORK
        if(login == "" || fName == "" || lName == "" || phone == "" || email == "") {
            alert("All fields are required")
            return false;
        }
        if (!email.match(mailFormat)) {
            alert("invalid email address");
            return false;
        }
        var pass = document.getElementById('password').value
        var repeatedPass = document.getElementById('repeatPassword').value
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