<!DOCTYPE html>
<html>
<head>

</head>
<body>
    <a href="/cart">Go to cart</a>
    <a href="/divideBy0">Cause error 500</a>
    <hr>
    <p>home page</p>
    <form action="/order" method="get">
        <button>View categories</button>
    </form>
    <#if currentUser??>
        <p>Hi, ${currentUser.firstName}</p>
        <form action="/logout" method="get">
            <button>Logout</button>
        </form>
        <form action="/myprofile" method="get">
            <button>Go to profile</button>
        </form>
        <form action="/reorder/last" method="get">
            <button>Reorder your last XD</button>
        </form>
    <#else>
        <p>You are not logged in</p>
        <form action="/login" method="get">
            <input type="submit" value="Log in">
        </form>
    </#if>
    <form action="/register" method="get">
        <button>Register</button>
    </form>
<div id="fav">
    <h1>YOUR FAVOURITES</h1>
    <p>Favourite pizzas</p>
    <ol>
        <#list favPizzaList as pizza>
        <li>${pizza.name}, ${pizza.description},
            <#if pizza.vege> is vege,
            <#else> is not wege,
        </#if>
        $${pizza.price}, rating: ${pizza.rating}
        <button onclick="addToCart('pizza', ${pizza.id})">+</button>
        <button onclick="removeFromCart('pizza', ${pizza.id})">-</button>
        </li>
        <#else>
        <p>for some reason we found zero pizzas</p>
        </#list>
    </ol>

</div>
<div id="daily">
    <h1>DAILY DISCOUNTS</h1>
    <p>PIZZA OF THE DAY!</p>
    <#list pizzasOfTheDay as pizzaOfTheDay>
        ${pizzaOfTheDay.name}
        <button onclick="addToCart('pizza', ${pizzaOfTheDay.id})">+</button>
        <button onclick="removeFromCart('pizza', ${pizzaOfTheDay.id})">-</button><br>
    </#list>
    <p>SAUCE OF THE DAY!</p>
    ${sauceOfTheDay.name}
    <button onclick="addToCart('sauce', ${sauceOfTheDay.id})">+</button>
    <button onclick="removeFromCart('sauce', ${sauceOfTheDay.id})">-</button>
    <p>DRINK OF THE DAY!</p>
    ${drinkOfTheDay.name}
    <button onclick="addToCart('drink', ${drinkOfTheDay.id})">+</button>
    <button onclick="removeFromCart('drink', ${drinkOfTheDay.id})">-</button>
</div>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="js/cart.js"></script>
</body>
</html>