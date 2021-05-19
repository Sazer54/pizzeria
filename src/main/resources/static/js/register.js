function validateForm() {
        var login = document.forms["marcin"]["login"].value;
        var fName = document.forms["marcin"]["firstName"].value;
        var lName = document.forms["marcin"]["lastName"].value;
        var phone = document.forms["marcin"]["phone"].value;
        var email = document.forms["marcin"]["email"].value;
        var pass = document.forms["marcin"]["password1"].value
        var repeatedPass = document.forms["marcin"]["password2"].value
        var city = document.forms["marcin"]["city"].value
        var postalCode = document.forms["marcin"]["postalCode"].value
        var address = document.forms["marcin"]["address"].value
        // ADD PHONE VALIDATION
        // ADD ALL FIELDS REQUIRED, CUZ BELOW DOESN'T WORK
        if(login == "" || fName == "" || lName == "" || phone == "" || email == "" || password1 == "" || password2 == ""
            ||  city == "" || postalCode == "" || address == "") {
            alert("All fields are required");
            return false;
        }
        if (pass != repeatedPass) {
            alert("passwords dont match");
            return false;
        }
        if (phone.length != 9){
            console.log(phone.length)
            alert("Phone must be 9 characters long");
            return false;
        }
        return true;
 }

 function validatePassChange() {
        var pass = document.forms["tomek"]["password1"].value
        var repeatedPass = document.forms["tomek"]["password2"].value
        if (pass == "" || repeatedPass == "") {
            alert("Fill both fields!");
            return false;
        }
        if (pass != repeatedPass) {
            alert("passwords dont match");
            return false;
        } else {
            return true;
        }
 }

 function validateNameChange() {
        var fName = document.forms["marcin"]["firstName"].value;
        var lName = document.forms["marcin"]["lastName"].value;
        if(fName == "" || lName == "") {
            alert("All fields are required");
            return false;
        }
        return true;
 }

 function validateEmailChange() {
        var email = document.forms["marcin"]["email"].value;
        if(email == "") {
                     alert("All fields are required");
                     return false;
                 }
                 return true;
 }

 function validatePhoneChange() {
         var phone = document.forms["marcin"]["phone"].value;
         if(phone == "") {
            alert("All fields are required");
            return false;
         }
         if (phone.length != 9) {
            alert("Phone must be 9 characters long");
            return false;
         }
         return true;
  }

  function validateAddressChange() {
     var city = document.forms["marcin"]["city"].value
     var postalCode = document.forms["marcin"]["postalCode"].value
     var address = document.forms["marcin"]["address"].value

     if (city == '' || postalCode == '' || address == '') {
        alert("All fields are required");
        return false;
     }

  }