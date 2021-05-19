<!DOCTYPE html>
<html>
<head>
    <title>Order page</title>
    <link rel="icon" href="img/favicon.png">
</head>
<body>
<p>order page</p>
<form action="/home" method="get">
    <input type="submit" value="go to home">
</form>
<div id="categories">
    <h1>CATEGORIES AND PRODUCTS</h1>
    <p id="pizzas">PIZZAS:</p>
    <ul>
        <#list pizzaList as pizza>
            <li>${pizza.name}, ${pizza.description},
                <#if pizza.vege> is vege,
                <#else> is not wege,
                </#if>
                $${pizza.price}
                rating: ${pizza.rating}

                <button onclick="addToCart('pizza', ${pizza.id})">+</button>
                <button onclick="removeFromCart('pizza', ${pizza.id})">-</button>

                <#list pizzasOfTheDay as pizzaOfTheDay>
                    <#if pizza.name == pizzaOfTheDay.name>
                    50% OFF!
                    </#if>
                </#list>
            </li>
        <#else>
        <p>for some reason we found zero pizzas</p>
        </#list>
    </ul>
    <p>SAUCES:</p>
    <ul>
        <#list sauceList as sauce>
        <li>${sauce.name},
            <#if sauce.vege> is vege,
            <#else> is not vege,
            </#if>
            $${sauce.price}, rating: ${sauce.rating}
        <button onclick="addToCart('sauce', ${sauce.id})">+</button>
        <button onclick="removeFromCart('sauce', ${sauce.id})">-</button>
        <#if sauce.name == sauceOfTheDay.name>
            50% OFF!
        </#if>
        </li>
        <#else>
        <p>for some reason we found zero sauces</p>
    </#list>
    </ul>
    <p>DRINKS:</p>
    <ul>
        <#list drinkList as drink>
            <li>${drink.name}, $${drink.price}, rating: ${drink.rating}
                <button onclick="addToCart('drink', ${drink.id})">+</button>
                <button onclick="removeFromCart('drink', ${drink.id})">-</button>
                <#if drink.name == drinkOfTheDay.name>
                    50% OFF!
                </#if>
            </li>
        <#else>
            <p>for some reason we found zero drinks</p>
        </#list>
    </ul>
</div>

<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="js/cart.js"></script>
</body>
</html>