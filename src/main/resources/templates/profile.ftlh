<!DOCTYPE html>
<html lang="pl">
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

    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="css/user.css" />
    <script src="https://kit.fontawesome.com/69996af9d1.js" crossorigin="anonymous"></script>
  </head>
  <body>
    <div class="container-fluid">
      <a href="/home"><div class="row"><div class="col-12" id="Headerlogo"></div></div></a>
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
      <div class="row mt-4 mb-">
        <div class="col-3 ml-5 mb-2 shadow h-100" id="credentials">
          <div
            class="row justify-content-center border-bottom border-dark pb-2"
          >
            <img
              src="img/profilepic.png"
              alt="profile pic"
              class="shadow"
              id="pic"
            />
          </div>
          <div class="row">
            <p class="col-12 text-center text-white lead">${currentUser.login}</p>
          </div>
          <div class="row" id="context">
            <p class="col-6 text-center lead">NAME</p>
            <p class="col-6 text-center lead">
              SURNAME <a href="/myprofile/change/name"> * </a>
            </p>
          </div>
          <div class="row">
            <p
              class="col-6 text-center"
              id="data"
              style="border-right: 1px #343a40 solid"
            >
              ${currentUser.firstName}
            </p>
            <p class="col-6 text-center" id="data">${currentUser.lastName}</p>
          </div>
          <div class="row" id="context">
            <p class="col-12 text-center lead">
              E-MAIL <a href="/myprofile/change/email"> * </a>
            </p>
          </div>
          <div class="row">
            <p class="col-12 text-center" id="data">
              ${currentUser.email}
            </p>
          </div>

          <div class="row" id="context">
            <p class="col-12 text-center lead">
              PHONE NUMBER <a href="/myprofile/change/phone"> * </a>
            </p>
          </div>
          <div class="row">
            <p class="col-12 text-center" id="data">${currentUser.phone}</p>
          </div>
          <div class="row" id="context">
            <p class="col-12 text-center lead">
              Adress <a href="/myprofile/change/address"> * </a>
            </p>
          </div>
          <div class="row">
            <p
              class="col-6 text-center"
              id="data"
              style="border-right: 1px #343a40 solid"
            >
              ${currentUser.city}
            </p>
            <p class="col-6 text-center" id="data">${currentUser.postalCode}</p>
          </div>
          <div class="row">
            <p
              class="col-12 text-center"
              id="data"
              style="
                border-top: 0px;
                border-bottom: 0px;
                border-bottom-left-radius: 10px;
                border-bottom-right-radius: 10px;
              "
            >
              ${currentUser.address}
            </p>
          </div>
        </div>
        <div class="col-2"></div>
        <div class="col-6">
          <div class="card border-0 p" style="background-color: #eee2d3">
            <div class="card-header bg-dark display-4 text-white">
              Order History
            </div>
            <#assign orderNumber = 0>
            <div class="card-body p-2 bg-light mb-4 shadow">
              <#list orders as order>
                <#assign orderNumber += 1>
                <div class="row w-100 justify-content-between mt-2">
                  <h4 class="col-5 card-title font-weight-lighter">${order.formattedReceivedTime}</h4>
                  <button
                    class="col-2 btn btn-dark"
                    type="button"
                    data-toggle="collapse"
                    data-target="#contentId${orderNumber}"
                    id="showBtn${orderNumber}"
                    onclick="changeShow(${orderNumber})"
                  >Show</button>
                </div>
             
                <div class="collapse card-text w-100" id="contentId${orderNumber}">
                  <div class="mt-2">
                    <div class="text-right lead p-2 border-bottom border-dark">It took us ${order.preparationLength} minutes to complete your order</div>
                    <table class="table border-0" id="orderdata">
                      <thead>
                        <tr>
                          <th>PRODUCT</th>
                          <th>AMMOUNT</th>
                          <th>COST</th>
                        </tr>
                      </thead>
                      <tbody>
                        <#assign sum = 0>
                        <#list order.orderPizzas as orderPizza>
                          <tr>
                            <td scope="row">${orderPizza.pizza.name}</td>
                            <td>x${orderPizza.pizzaQuantity}</td>
                            <td>
                              <#if orderPizza.boughtOnDiscount>
                                ${((orderPizza.pizza.price / 2) * orderPizza.pizzaQuantity)?string(",##0.00")}
                                <#assign sum+= (orderPizza.pizza.price / 2) * orderPizza.pizzaQuantity>
                              <#else>
                                ${(orderPizza.pizza.price * orderPizza.pizzaQuantity)?string(",##0.00")}
                                <#assign sum+= orderPizza.pizza.price * orderPizza.pizzaQuantity>
                              </#if>
                              zl</td>
                          </tr>
                        </#list>
                        <#list order.orderSauces as orderSauce>
                          <tr>
                            <td scope="row">${orderSauce.sauce.name}</td>
                            <td>x${orderSauce.sauceQuantity}</td>
                            <td>
                              <#if orderSauce.boughtOnDiscount>
                              ${((orderSauce.sauce.price / 2) * orderSauce.sauceQuantity)?string(",##0.00")}
                              <#assign sum+= (orderSauce.sauce.price / 2) * orderSauce.sauceQuantity>
                              <#else>
                              ${(orderSauce.sauce.price * orderSauce.sauceQuantity)?string(",##0.00")}
                              <#assign sum+= orderSauce.sauce.price * orderSauce.sauceQuantity>
                            </#if>
                            zl</td>
                          </tr>
                        </#list>
                        <#list order.orderDrinks as orderDrink>
                          <tr>
                            <td scope="row">${orderDrink.drink.name}</td>
                            <td>x${orderDrink.drinkQuantity}</td>
                            <td>
                              <#if orderDrink.boughtOnDiscount>
                              ${((orderDrink.drink.price / 2) * orderDrink.drinkQuantity)?string(",##0.00")}
                              <#assign sum+= (orderDrink.drink.price / 2) * orderDrink.drinkQuantity>
                              <#else>
                              ${(orderDrink.drink.price * orderDrink.drinkQuantity)?string(",##0.00")}
                              <#assign sum+= orderDrink.drink.price * orderDrink.drinkQuantity>
                            </#if>
                            zl</td>
                          </tr>
                        </#list>
                      </tbody>
                    </table>
                    <div class="d-flex w-100 border-top border-dark">
                      <div class="col-5 text-left lead p-2">Prepared by: ${order.cook.firstName} ${order.cook.lastName},<br> ${order.cook.title.name}</div>
                      <div class="col-4 text-center lead p-2">TOTAL COST:${sum}zł</div>
                      <button type="button" class="col-3 btn btn-dark mt-1" onclick="location.href = '/reorder/id/${order.id?long?c}'">REORDER</button>
                    </div>

                  </div>
                </div>
              </#list>
            <!--<div class="row w-100 justify-content-between mt-2">
              <h4 class="col-5 card-title font-weight-lighter">Order No.2</h4>
              <button
                class="col-2 btn btn-dark"
                type="button"
                data-toggle="collapse"
                data-target="#contentId1"
              >
                Show
              </button>
            </div>
            <div class="collapse card-text w-100" id="contentId1">
              <div class="mt-2">
                <div class="text-right lead p-2 border-bottom border-dark">Ordered 20.02.2021</div>
                <table class="table border-0" id="orderdata">
                  <thead>
                    <tr>
                      <th>PRODUCT</th>
                      <th>AMMOUNT</th>
                      <th>COST</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td scope="row">MARGARITTA</td>
                      <td>x5</td>
                      <td>4000zl</td>
                    </tr>
                    <tr>
                      <td scope="row">something</td>
                      <td>x6</td>
                      <td>20zl</td>
                    </tr>
                  </tbody>
                </table>
                <div class="text-right lead p-2 border-top border-dark">TOTAL COST:500zł</div>
              </div>
            </div> -->
            </div>
          </div>
        </div>
      </div>
      <div class="row footer bg-dark justify-content-center">
        <pre>
      Kacper Kwietniewski - FrontEnd | Szymon Skowroński - BackEnd
      Bartosz Banasiak    - DataBase | Jacek Szwed       - Documentation</pre
        >
      </div>
    </div>
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
  <script>
    function changeShow(id) {
      var theButton = document.getElementById('showBtn' + id)
      if (theButton.innerHTML == 'Show') {
        theButton.innerHTML = 'Hide'
      } else {
        theButton.innerHTML = 'Show'
      }
    }
  </script>
  </body>
</html>
