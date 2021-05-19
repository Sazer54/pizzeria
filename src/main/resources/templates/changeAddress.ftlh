<!DOCTYPE html>
<html lang="en">
<head>
  <title>KSSR</title>
  <link rel="icon" href="../../img/favicon.png">
  <meta charset="utf-8" />
  <meta
          name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no"
  />

  <link
          rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous"
  />
  <link rel="stylesheet" href="../../css/login.css" />
  <script src="https://kit.fontawesome.com/69996af9d1.js" crossorigin="anonymous"></script>
</head>

<body>
<div class="container-fluid p-0">
  <a href="/home">
    <div class="row">
      <div class="col-12" id="Headerlogo"></div>
    </div>
  </a>
  <div class="row sticky-top">
    <div class="col-6 bg-dark d-flex justify-content-start align-items-center">
      <button class="btn btn-dark text-white mr-4 pt-4 pb-0" onclick="location.href = '/home'">
        <i class="fas fa-home fa-2x"></i>
        <p>Home</p>
      </button>
      <p class="display-4 text-white pt-2 pt-2">KSSR . COM</p>
    </div>
    <div
            class="col-6 bg-dark text-white display-4 d-flex align-items-center justify-content-end"
    >
      <button class="btn btn-dark text-white mr-4" id="Loginbutton">
        A B O U T &nbsp; U S
      </button>
      <button class="btn btn-dark text-white mr-4 pt-4 pb-0" id="Loginbutton" onclick="location.href = '/cart'">
        <i class="fas fa-shopping-cart fa-2x"></i>
        <p>Cart</p>
      </button>
      <div class="dropdown">
        <button class="btn btn-dark text-white mr-4 pt-4 pb-0" id="Loginbutton" data-toggle="dropdown">
          <i class="fas fa-user fa-2x"></i>
          <p>Your account</p>
        </button>
        <div class="dropdown-menu dropdown-menu-right">

          <#if currentUser??>
          <h6 class="dropdown-header">Hi, ${currentUser.firstName}</h6>
          <a class="dropdown-item" href="/myprofile">My profile</a>

          <a class="dropdown-item" href="/myprofile/change/password">Change password</a>
          <a class="dropdown-item" href="/deleteaccount">Delete account</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="/register">Register</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="/logout">Logout</a>
          <#else>
          <h6 class="dropdown-header">Log in or create an account</h6>
          <a class="dropdown-item" href="/login">Login</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="/register">Register</a>

        </#if>



      </div>
    </div>
  </div>
</div>
<form class="form-change shadow-lg mt-4 text-center text-dark" method="post" action="/myprofile/change/address" name="marcin" onsubmit="return validateAddressChange()">
  <h1 class="display-4">
    Hi ${currentUser.firstName} ${currentUser.lastName}! <br />
    Your new Adress:
  </h1>
  <div class="row form-group justify-content-between">
    <input
            type="text"
            class="form-control"
            id="city"
            placeholder="New City"
            name="city"
    />
    <input
            type="text"
            class="form-control"
            id="postal"
            placeholder="New Postal"
            name="postalCode"
    />
  </div>
  <div class="row form-group">
    <input type="text" class="form-control" id="street" placeholder="New Street" name="address">
  </div>
  <button type="submit" id='btn' class="btn">Change Adress</button>
</form>
<div class="row footer bg-dark justify-content-center fixed-bottom" id="jumpto">
        <pre>
          Kacper Kwietniewski - FrontEnd | Szymon Skowroński - BackEnd
          Bartosz Banasiak    - DataBase | Jacek Szwed       - Documentation</pre
        >
</div>
<script src="../../js/register.js"></script>
<script
        src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"
></script>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
        crossorigin="anonymous"
></script>
</body>
</html>
