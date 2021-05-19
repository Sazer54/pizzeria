<!DOCTYPE html>
<html lang="en">
  <head>
    <title>KSSR</title>
    <link rel="icon" href="img/favicon.png">
    <!-- Required meta tags -->
    <meta charset="utf-8" />
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
        <div class="row sticky-top border-bottom border-light">
          <div class="col-4 bg-dark d-flex justify-content-start align-items-center">
            <button class="btn btn-dark text-white mr-4 pt-4 pb-0" onclick="location.href = '/home'">
              <i class="fas fa-home fa-2x"></i>
              <p>Home</p>
            </button>
            <p class="display-4 text-white pt-2 pt-2">KSSR . COM</p>
          </div>
          <div
                  class="col-4 bg-dark text-white display-4 d-flex align-items-center justify-content-center"
          >
            <button type="button" class="btn btn-dark">
              <a href="/order#jumppizza" class="text-white lead">PIZZA</a>
            </button>
            <button type="button" class="btn btn-dark">
              <a href="/order#jumpsauce" class="text-white lead">SAUCES</a>
            </button>
            <button type="button" class="btn btn-dark">
              <a href="/order#jumpdrink" class="text-white lead">DRINKS</a>
            </button>
          </div>
            <div
                    class="col-4 bg-dark text-white display-4 d-flex align-items-center justify-content-end"
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
      <div class="mx-auto" style="width:60%;">
        <div
          class="row justify-content-center mt-3 bg-dark text-white lead py-3"
          id="jumppizza"
          style="font-size: 300%;letter-spacing:3px;font-weight:bold;"
        >
          PIZZA
        </div>
        <div class="row p-1 justify-content-center">
          <#list pizzaList as pizza>
            <div class="card shadow border-0 col-sm-3 p-0 mt-3 mb-3">
              <div
                class="card-header text-center lead text-white"
                style="
                  font-size: 150%;
                  height: 100%;
                  max-height: 75px;
                  border-radius: 0px;
                  background-color:#8A0303;
                "
              >
                <p class="pt-1">${pizza.name}</p>
              </div>

              <div class="card-body">
                <p class="lead" style="font-size: 150%">Ingredients:</p>
                <p>
                  ${pizza.description}
                </p>
                <#if pizza.vege> <p class="lead" style="font-size: 150%;color:#056608;font-weight:bold">VEGE</p>
                <#else> <p class="lead" style="font-size: 150%;color:#850101;font-weight:bold;text-decoration:line-through;">VEGE</p>
              </#if>
              </div>

              <div
                class="card-footer text-center lead bg-dark text-white"
                style="border-radius: 0%"
              >
                <div class="row border-bottom border-light">
                  <div class="col-12 text-center">
                    <p class="mb-1">RATED: ${pizza.rating} / 10</p>
                  </div>
                </div>
                <div class="row">
                  <#assign isPizzaOfTheDay = false>
                  <#list pizzasOfTheDay as pizzaOfTheDay>
                    <#if pizzaOfTheDay.name = pizza.name>
                      <#assign isPizzaOfTheDay = true>
                      <#break>
                    </#if>
                  </#list>
                  <#if isPizzaOfTheDay>

                      <div
                              class="col-4 text-right pt-3"
                              style="text-decoration: line-through; font-size: 83%;"
                      >
                        ${(pizza.price)?string(",##0.00")} zł
                      </div>
                      <div class="col-4 text-left pt-3" style="font-size: 83%;">${(pizza.price / 2)?string(",##0.00")} zł</div>
                      <div class="col-4 pt-1">
                        <button
                                type="button"
                                class="lead btn btn-dark w-100"
                                style="font-size: 125%;font-weight:bold;"
                                onclick="addToCart('pizza', ${pizza.id})"
                        >
                          +
                        </button>
                      </div>



                  <#else>
                    <div class="col-6 text-center pt-3">${(pizza.price)?string(",##0.00")} zł</div>
                    <div class="col-6 pt-1">
                      <button
                              type="button"
                              class="lead btn btn-dark w-100"
                              style="font-size: 125%;font-weight:bold;"
                              onclick="addToCart('pizza', ${pizza.id})"
                      >
                       +
                      </button>
                    </div>
                  </#if>
                </div>
              </div>
            </div>
          </#list>
        </div>
        <div
          class="row justify-content-center mt-3 bg-dark text-white lead py-3"
          id="jumpsauce"
          style="font-size: 300%;letter-spacing:3px;font-weight:bold;"
        >
          SAUCES
        </div>
        <div class="row p-1 justify-content-center">
          <#list sauceList as sauce>
            <div class="card shadow border-0 col-sm-3 p-0 mt-3 mb-4" style="min-height: 100px;max-height: 150px;">
              <div
                class="card-header text-center lead text-white border-bottom border-light"
                style="
                  font-size: 150%;
                  height: 100%;
                  max-height: 75px;
                  border-radius: 0px;
                  background-color:#8A0303;
                "
              >
                <p class="pt-1">${sauce.name}</p>
              </div>

              <div
                class="card-body text-center lead bg-light text-dark"
                style="border-radius: 0%"
              >
                <div class="d-flex border-bottom border-dark">
                  <div class="col-6 text-center">
                    <#if sauce.vege> <p class="mb-1" style="font-size: 150%;color:#056608;font-weight:bold">VEGE</p>
                      <#else> <p class="mb-1" style="font-size: 150%;color:#850101;font-weight:bold;text-decoration:line-through;">VEGE</p>
                    </#if>
                  </div>
                  <div class="col-6 text-center">
                    <p class="mb-1" style="font-size:80%;">RATED: ${sauce.rating} / 10</p>
                  </div>
                </div>
                <div class="row">
                  <#if sauceOfTheDay.name = sauce.name>
                      <div
                              class="col-4 text-right pt-1"
                              style="text-decoration: line-through"
                      >
                        ${(sauce.price)?string(",##0.00")} zł
                      </div>
                      <div class="col-4 text-left pt-1">${(sauce.price / 2)?string(",##0.00")} zł</div>
                    <div class="col-4">
                      <button
                              type="button"
                              class="lead btn btn-dark mt-1 w-100"
                              style="font-size: 65%"
                              onclick="addToCart('sauce', ${sauce.id})"
                      >
                        +
                      </button>
                    </div>
                  <#else>
                    <div class="col-6 text-center pt-1">${(sauce.price)?string(",##0.00")} zł</div>
                    <div class="col-6">
                      <button
                              type="button"
                              class="lead btn btn-dark mt-1 w-100"
                              style="font-size: 65%"
                              onclick="addToCart('sauce', ${sauce.id})"
                      >
                        +
                      </button>
                    </div>
                  </#if>
                </div>
              </div>
            </div>
          </#list>
        </div>
        <div
          class="row justify-content-center mt-3 bg-dark text-white lead py-3"
          id="jumpdrink"
          style="font-size: 300%;letter-spacing:3px;font-weight:bold;"
        >
          DRINKS
        </div>
        <div class="row p-1 justify-content-center mb-5">
          <#list drinkList as drink>
            <div class="card shadow border-0 col-sm-3 p-0 mt-3 mb-3" style="min-height:100px;max-height: 150px;">
              <div
                class="card-header text-center lead text-white border-bottom border-light"
                style="
                  font-size: 150%;
                  height: 100%;
                  max-height: 75px;
                  border-radius: 0px;
                  background-color:#8A0303;
                "
              >
                <p class="pt-1">${drink.name}</p>
              </div>

              <div
                class="card-footer text-center lead bg-light text-dark"
                style="border-radius: 0%"
              >
                <div class="row border-bottom border-dark">
                  <div class="col-6 text-center">
                    <p class="mb-1">0,5L</p>
                  </div>
                  <div class="col-6 text-center">
                    <p class="mb-1">${drink.rating} / 10</p>
                  </div>
                </div>
                <div class="row">
                  <#if drink.name = drinkOfTheDay.name>
                    <div
                            class="col-4 text-right pt-1"
                            style="text-decoration: line-through"
                    >
                      ${(drink.price)?string(",##0.00")} zł
                    </div>
                    <div class="col-4 text-center pt-1">${(drink.price / 2)?string(",##0.00")} zł</div>
                    <div class="col-4">
                      <button
                        type="button"
                        class="lead btn btn-dark mt-1 w-100"
                        style="font-size: 65%"
                        onclick="addToCart('drink', ${drink.id})"
                      >
                        +

                      </button>
                    </div>
                  <#else>
                    <div class="col-6 text-center pt-1">${(drink.price)?string(",##0.00")} zł</div>
                    <div class="col-6">
                      <button
                              type="button"
                              class="lead btn btn-dark mt-1 w-100"
                              style="font-size: 65%"
                              onclick="addToCart('drink', ${drink.id})"
                      >
                        +
                      </button>
                    </div>
                  </#if>
                </div>
              </div>
            </div>
          </#list>
        </div>
      </div>
      <div class="row footer bg-dark justify-content-center " id="jumpto">
        <pre>
          Kacper Kwietniewski - FrontEnd | Szymon Skowroński - BackEnd
          Bartosz Banasiak    - DataBase | Jacek Szwed       - Documentation</pre
        >
      </div>

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
  </body>
</html>
