<!DOCTYPE html>
<html lang="en">
  <head>
    <title>KSSR</title>
    <link rel="icon" href="img/favicon.png">
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <!-- Bootstrap CSS -->
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="css/basket.css" />
    <script src="https://kit.fontawesome.com/69996af9d1.js" crossorigin="anonymous"></script>
  </head>

  <body style="margin-bottom: 300px;">
    <div class="container-fluid">
      <a href="/home">
        <div class="row">
          <div class="col-12" id="Headerlogo"></div>
        </div>
      </a>
      <div class="row sticky-top mb-4">
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
    <div class="container shadow text-center mt-4" id="bodydiv" style="padding-bottom:100px;">

      <#if order??>
        <div class="row display-4 border-bottom border-dark text-center">
          <div class="col-12">Your order:</div>
        </div>
        <div class="row justify-content-between">
          <table class="col-6 table1 table-striped border-right border-dark">
            <thead>
              <tr>
                <th>PRODUCT</th>
                <th>AMOUNT</th>
                <th>COST</th>
                <th>ADD/REMOVE</th>
              </tr>
            </thead>

            <tbody>
              <#assign sum = 0>
              <#list cart.orderPizzas as orderPizza>
                <tr>
                  <td class='text-center' scope="row">${orderPizza.pizza.name}</td>
                  <td class="text-center">x${orderPizza.pizzaQuantity}</td>
                  <td class="text-center">
                    <#if orderPizza.boughtOnDiscount>
                      ${((orderPizza.pizza.price / 2) * orderPizza.pizzaQuantity)?string(",##0.00")}
                      <#assign sum+= (orderPizza.pizza.price / 2) * orderPizza.pizzaQuantity>
                    <#else>
                      ${(orderPizza.pizza.price * orderPizza.pizzaQuantity)?string(",##0.00")}
                      <#assign sum+= orderPizza.pizza.price * orderPizza.pizzaQuantity>
                    </#if>
                    zł</td>
                  <td class="d-flex justify-content-center">
                    <button class="btn btn-danger mx-1 w-50 mt-1" onclick="removeFromCart('pizza', ${orderPizza.pizza.id});location.href='/cart'">-</button>
                    <button class="btn btn-success mx-1 w-50 mt-1" onclick="addToCart('pizza', ${orderPizza.pizza.id});location.href='/cart'">+</button>
                  </td>
                </tr>
              </#list>
              <#list cart.orderSauces as orderSauce>
                <tr>
                  <td scope="row" class="text-center">${orderSauce.sauce.name}</td>
                  <td class="text-center">x${orderSauce.sauceQuantity}</td>
                  <td class="text-center">
                    <#if orderSauce.boughtOnDiscount>
                    ${((orderSauce.sauce.price / 2) * orderSauce.sauceQuantity)?string(",##0.00")}
                    <#assign sum+= (orderSauce.sauce.price / 2) * orderSauce.sauceQuantity>
                    <#else>
                    ${(orderSauce.sauce.price * orderSauce.sauceQuantity)?string(",##0.00")}
                    <#assign sum+= orderSauce.sauce.price * orderSauce.sauceQuantity>
                  </#if>
                  zł</td>
                  <td class="d-flex justify-content-center">
                    <button class="btn btn-danger mx-1 w-50 mt-1" onclick="removeFromCart('sauce', ${orderSauce.sauce.id});location.href='/cart'">-</button>
                    <button class="btn btn-success mx-1 w-50 mt-1" onclick="addToCart('sauce', ${orderSauce.sauce.id});location.href='/cart'">+</button>
                  </td>
                </tr>
              </#list>
              <#list cart.orderDrinks as orderDrink>
                <tr>
                  <td scope="row" class="text-center">${orderDrink.drink.name}</td>
                  <td class="text-center">x${orderDrink.drinkQuantity}</td>
                  <td class="text-center">
                    <#if orderDrink.boughtOnDiscount>
                    ${((orderDrink.drink.price / 2) * orderDrink.drinkQuantity)?string(",##0.00")}
                    <#assign sum+= (orderDrink.drink.price / 2) * orderDrink.drinkQuantity>
                    <#else>
                    ${(orderDrink.drink.price * orderDrink.drinkQuantity)?string(",##0.00")}
                    <#assign sum+= orderDrink.drink.price * orderDrink.drinkQuantity>
                  </#if>
                  zl</td>
                  <td class="d-flex justify-content-center">
                    <button class="btn btn-danger mx-1 w-50 mt-1" onclick="removeFromCart('drink', ${orderDrink.drink.id});location.href='/cart'">-</button>
                    <button class="btn btn-success mx-1 w-50 mt-1" onclick="addToCart('drink', ${orderDrink.drink.id});location.href='/cart'">+</button>
                  </td>
                </tr>
              </#list>
            </tbody>
          </table>
          <div class="col-6 mt-auto mb-3 border-top border-dark">
            <#if order.user??>
              <div class="row">
                <div
                  class="col-6 text-center lead border-bottom border-dark pb-2 pt-2"
                >
                  ${order.user.city}
                </div>
                <div
                  class="col-6 text-center lead border-bottom border-dark pb-2 pt-2"
                >
                  ${order.user.postalCode}
                </div>
              </div>
              <div class="row lead">
                <div class="col-12">${order.user.address}</div>
              </div>
            </#if>
          </div>
        </div>
        <div class="row border-top border-dark">
          <div class="col-6 text-right lead p-2">TOTAL COST: ${sum?string(",##0.00")} zł</div>
          <div class="col-3 text-center lead p-2">
            <button type="button" class="btn btn-dark" onclick="location.href = '/completeorder'">CONFIRM</button>
          </div>
          <div class="col-3 text-center lead p-2">
            <button type="button" class="btn btn-dark" onclick="location.href = '/cancelorder'">CANCEL ORDER</button>
          </div>
        </div>
      <#else>
        <div class="row display-4 border-dark text-center">
          <div class="col-12">Your order:</div>
        </div>
        <div class="row display-4 border-bottom border-dark border-0 text-center pb-2" style="font-size: 80%;font-weight:bold;">
          <div class="col-12">Nothing here yet</div>
        </div>
      </#if>
    </div>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <script src="js/cart.js"></script>
    <script
      src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
      integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
      integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
      integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
      crossorigin="anonymous"
    ></script>
  <div class="row footer bg-dark justify-content-center fixed-bottom" id="jumpto">
          <pre>
            Kacper Kwietniewski - FrontEnd | Szymon Skowroński - BackEnd
            Bartosz Banasiak    - DataBase | Jacek Szwed       - Documentation</pre
          >
  </div>
  </body>

</html>
