<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>KSSR</title>
    <link rel="icon" href="img/favicon.png">
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
      integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
      crossorigin="anonymous"
    />

    <link rel="stylesheet" href="css/css.css" />
    <script src="https://kit.fontawesome.com/69996af9d1.js" crossorigin="anonymous"></script>
  </head>

  <body>
    <div class="container-fluid">
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
      <div class="row">
        <div class="col-1"></div>
        <div class="col-3">
          <div
            class="text-center mt-3 bg-dark text-white lead"
            style="font-size: 200%"
          >
            YOUR FAVOURITES!
          </div>
          <div
            id="discountcarousel"
            class="carousel slide shadow border-dark mt-3"
            data-ride="carousel"
          >
            <ol class="carousel-indicators">
              <li
                data-target="#discountcarousel"
                data-slide-to="0"
                class="active"
              ></li>
              <li data-target="#discountcarousel" data-slide-to="1"></li>
              <li data-target="#discountcarousel" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
              <#assign isFirst = true>
              <#list favPizzaList as pizza>
              <#if isFirst> <div class="carousel-item active">
                <#else> <div class="carousel-item">
              </#if>
                <img
                  src="${pizza.imgPath}"
                  class="d-block"
                  height="450px"
                />
                <div class="carousel-caption d-none d-md-block lead text-white" style="font-size:250%;font-weight:bold">
                  <p>${pizza.name}</p>
                </div>
              </div>
              <#if isFirst> <#assign isFirst = false>
              </#if>
              </#list>
            </div>
            <a
              class="carousel-control-prev"
              href="#discountcarousel"
              role="button"
              data-slide="prev"
            >
              <span
                class="carousel-control-prev-icon"
                aria-hidden="true"
              ></span>
              <span class="sr-only">Previous</span>
            </a>
            <a
              class="carousel-control-next"
              href="#discountcarousel"
              role="button"
              data-slide="next"
            >
              <span
                class="carousel-control-next-icon"
                aria-hidden="true"
              ></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
        </div>

        <div class="col-8">
          <div
                  class="text-center mt-3 bg-dark text-white lead"
                  style="font-size: 200%"
          >
            DAILY DISCOUNTS!
          </div>
          <div
            class="text-center mt-3 text-white lead"
            style="font-size: 200%"
          ></div>
          <div class="card-deck mt-3">
            <#list pizzasOfTheDay as pizzaOfTheDay>
              <div class="card shadow border-0">
                <div
                  class="card-header text-center lead text-white"
                  style="font-size: 150%; height: 100%; max-height: 75px;background-color:#8A0303;"
                >
                  <p class="pt-1">${pizzaOfTheDay.name}</p>
                </div>

                <div class="card-body">
                  <p class="lead" style="font-size: 150%">Ingredients:</p>
                  <p>
                    ${pizzaOfTheDay.description}
                  </p>
                  <#if pizzaOfTheDay.vege> <p class="lead" style="font-size: 150%;color:#056608;font-weight:bold">VEGE</p>
                    <#else> <p class="lead" style="font-size: 150%;color:#850101;font-weight:bold;text-decoration:line-through;">VEGE</p>
                  </#if>

                </div>

                <div class="card-footer text-center lead bg-dark text-white">
                  <div class="row border-bottom border-light">
                    <div class="col-12 text-center">
                      <p class="mb-1">RATED: ${pizzaOfTheDay.rating} / 10</p>
                    </div>
                  </div>
                  <div class="row" style="font-size:90%;">
                    <div
                      class="col-4 text-right mt-2"
                      style="text-decoration: line-through"
                    >
                      ${(pizzaOfTheDay.price)?string(",##0.00")} zł
                    </div>
                    <div class="col-4 text-left mt-2">${(pizzaOfTheDay.price / 2)?string(",##0.00")} zł</div>
                    <div class="col-4">
                      <button
                              type="button"
                              class="lead btn btn-dark w-100"
                              style="font-size: 125%;font-weight:bold;"
                              onclick="addToCart('pizza', ${pizzaOfTheDay.id})"
                      >
                        +
                      </button>
                    </div>
                  </div>
                </div>
              </div>
            </#list>
          </div>
        </div>
      </div>
      <div class="row mt-5">
        <div class="col-1"></div>
        <div class="col-3 justify-content-center">
          <div
            class="text-center mt-3 bg-dark text-white lead mx-auto"
            style="font-size: 200%;"
          >
            LAST ORDER
          </div>
          <div
            class="card text-center shadow ml-auto mr-auto mt-3"
            id="cat"
          >
            <#if currentUser??>
              <#if lastOrder??>
                <div class="mt-2">
                  <div class="lead p-2 border-bottom border-dark">
                    Ordered: ${lastOrder.formattedReceivedTime}
                  </div>
                  <div class="card-body">
                    <#assign itemsDisplayed = 0>
                    <table class="table border-0" id="orderdata">
                      <thead>
                        <tr>
                          <th>PRODUCT</th>
                          <th>AMOUNT</th>
                          <th>COST</th>
                        </tr>
                      </thead>
                      <tbody>
                        <#assign sum = 0>
                        <#list lastOrder.orderPizzas as orderPizza>
                          <#if itemsDisplayed < 2>
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
                              zł</td>
                            </tr>
                          <#else>
                            <#if orderPizza.boughtOnDiscount>
                              <#assign sum+= (orderPizza.pizza.price / 2) * orderPizza.pizzaQuantity>
                            <#else>
                              <#assign sum+= orderPizza.pizza.price * orderPizza.pizzaQuantity>
                            </#if>
                          </#if>
                          <#assign itemsDisplayed += 1>
                        </#list>
                        <#list lastOrder.orderSauces as orderSauce>
                          <#if itemsDisplayed < 2>
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
                              zł</td>
                            </tr>
                          <#else>
                            <#if orderSauce.boughtOnDiscount>
                              <#assign sum+= (orderSauce.sauce.price / 2) * orderSauce.sauceQuantity>
                            <#else>
                              <#assign sum+= orderSauce.sauce.price * orderSauce.sauceQuantity>
                            </#if>
                          </#if>
                          <#assign itemsDisplayed += 1>
                        </#list>
                        <#list lastOrder.orderDrinks as orderDrink>
                          <#if itemsDisplayed < 2>
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
                              zł</td>
                            </tr>
                          <#else>
                            <#if orderDrink.boughtOnDiscount>
                             <#assign sum+= (orderDrink.drink.price / 2) * orderDrink.drinkQuantity>
                            <#else>
                              <#assign sum+= orderDrink.drink.price * orderDrink.drinkQuantity>
                            </#if>
                          </#if>
                        <#assign itemsDisplayed += 1>
                        </#list>
                      </tbody>
                    </table>
                    <#if (itemsDisplayed >= 3)>
                      <p>...</p>
                    </#if>
                  </div>
                  <div class="lead p-2 border-top border-dark">
                    TOTAL COST:${sum?string(",##0.00")} zł
                  </div>
                </div>
                <div class="card-footer border-dark bg-dark">
                  <button type="button" class="btn btn-dark" onclick="location.href = '/reorder/id/${lastOrder.id?long?c}'">REORDER</button>
                </div>
              <#else>
                You have not ordered yet!
              </#if>
            <#else>
            <div class="mt-2">
              Login first to see your last order!
            </div>
          </#if>
          </div>
        </div>
        <div class="col-8">
          <div
            class="text-center mt-3 bg-dark text-white lead"
            style="font-size: 200%"
          >
            CATEGORIES
          </div>
          <div class="card-deck mb-5 mt-3">
            <a href="/order#jumppizza" class="col-4 p-0">
              <div class="card shadow border-0"  id="cat">
                <img
                  class="card-img-top"
                  id="catimg"
                  src="img/pizza2.png"
                  alt=""
                />
                <div class="card-body bg-dark text-white">
                  <h4 class="card-title">Pizza</h4>
                </div>
              </div>
            </a>
            <a href="/order#jumpsauce" class="col-4 p-0">
              <div class="card shadow border-0" id="cat">
                <img
                  class="card-img-top"
                  id="catimg"
                  src="img/sauce2.png"
                  alt=""
                />
                <div class="card-body bg-dark text-white">
                  <h4 class="card-title">Sauces</h4>
                </div>
              </div>
            </a>
            <a href="/order#jumpdrink" class="col-4 p-0">
              <div class="card shadow border-0" id="cat">
                <img
                  class="card-img-top"
                  id="catimg"
                  src="img/drink2.png"
                  alt=""
                />
                <div class="card-body bg-dark text-white">
                  <h4 class="card-title">Drinks</h4>
                </div>
              </div>
            </a>
          </div>
        </div>
      </div>
      <div class="row footer bg-dark justify-content-center" id="jumpto">
        <pre>
          Kacper Kwietniewski - FrontEnd | Szymon Skowroński - BackEnd
          Bartosz Banasiak    - DataBase | Jacek Szwed       - Documentation</pre
        >
      </div>
    </div>

<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="js/cart.js"></script>
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
