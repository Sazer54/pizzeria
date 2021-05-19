<!DOCTYPE html>
<html>
<head></head>
<body>
<h1>Welcome, ${currentUser.firstName}</h1>
<p>Your data:</p>
<ul>
    <li>Full name: ${currentUser.firstName} ${currentUser.lastName} <a href="/myprofile/change/name">change</a></li>
    <li>Phone: ${currentUser.phone} <a href="/myprofile/change/phone">change</a></li>
    <li>Mail: ${currentUser.email} <a href="/myprofile/change/email">change</a></li>
    <li>Address: ${currentUser.city}, ${currentUser.postalCode}, ${currentUser.address} <a href="/myprofile/change/address">change</a></li>
</ul>
<a href="/myprofile/change/password">I want to change my password</a><br>
<a href="/deleteaccount">delete my account</a>
<h1>Your orders:</h1>
    <#list orders as order>
        <form method="get" action="/reorder/id/${order.id}">
            <button>Reorder</button>
        </form>
        <#assign sum=0>
        <p>Order id: ${order.id}</p>
        <p>Prepared by: ${order.cook.firstName} ${order.cook.lastName}, a ${order.cook.title.name}</p>
        <p>Received time: ${order.formattedReceivedTime}</p>
        <p>Pizzas: </p>
        <ul>
            <#list order.orderPizzas as orderPizza>
            <li>Name: ${orderPizza.pizza.name}, Quantity: ${orderPizza.pizzaQuantity},
                Price:
                <#if orderPizza.boughtOnDiscount>
                $${(orderPizza.pizza.price / 2) * orderPizza.pizzaQuantity}
                <#assign sum+= (orderPizza.pizza.price / 2) * orderPizza.pizzaQuantity>
                <#else>
                $${orderPizza.pizza.price * orderPizza.pizzaQuantity}
                <#assign sum+= orderPizza.pizza.price * orderPizza.pizzaQuantity>
            </#if>
            </li>
            <#else>
                <p>No pizzas found</p>
            </#list>
        </ul>
        <p>Sauces:</p>
        <ul>
            <#list order.orderSauces as orderSauce>
            <li>Name: ${orderSauce.sauce.name}, Quantity: ${orderSauce.sauceQuantity},
                Price:
                <#if orderSauce.boughtOnDiscount>
                $${orderSauce.sauce.price / 2} * orderSauce.sauceQuantity}
                <#assign sum += (orderSauce.sauce.price / 2) * orderSauce.sauceQuantity>
                <#else>
                $${orderSauce.sauce.price * orderSauce.sauceQuantity}
                <#assign sum+=orderSauce.sauce.price * orderSauce.sauceQuantity>
            </#if>
            </li>
            <#else>
                <p>No sauces found</p>
            </#list>
        </ul>
        <p>Drinks:</p>
        <ul>
            <#list order.orderDrinks as orderDrink>
            <li>Name: ${orderDrink.drink.name}, Quantity: ${orderDrink.drinkQuantity},
                Price:
                <#if orderDrink.boughtOnDiscount>
                $${(orderDrink.drink.price / 2) * orderDrink.drinkQuantity}
                <#assign sum+=(orderDrink.drink.price / 2) * orderDrink.drinkQuantity>
                <#else>
                $${orderDrink.drink.price * orderDrink.drinkQuantity}
                <#assign sum+=orderDrink.drink.price * orderDrink.drinkQuantity>
            </#if>
            </li>
            <#else>
            <p>No drinks found</p>
        </#list>
        </ul>
        <p>Total price: $${sum}</p>
        <hr>
    <#else>
        <p>You have no orders</p>
    </#list>
</body>
</html>