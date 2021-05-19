<!DOCTYPE html>
<html>
<head>

</head>
<body>
    <#if emptyCart??>
        <p>Cannot submit empty cart</p>
    </#if>
    <#if order??>
        <form method="get" action="/cancelorder">
            <button>Cancel your order</button>
        </form>
        <form method="get" action="/completeorder">
            <button>Complete your order</button>
        </form>
        <p>Your cook will be prepared by: ${order.cook.firstName} ${order.cook.lastName}, a ${order.cook.title.name}</p>
        <#assign sum = 0>
        <p>Your pizzas:</p>
        <ul>
        <#list cart.orderPizzas as orderPizza>
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
            <p>In terms of pizza you have no pizza</p>
        </#list>
        </ul>
        <p>Your sauces:</p>
        <ul>
        <#list cart.orderSauces as orderSauce>
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
            <p>In terms of sauce you have no sauce</p>
        </#list>
        </ul>
        <p>Your drinks:</p>
        <ul>
        <#list cart.orderDrinks as orderDrink>
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
            <p>In terms of drinks you have no drinks</p>
        </#list>
        </ul>
        <p>In total you will pay: $${sum}</p>
    <#else>
        <p>Your cart is empty</p>
    </#if>
</body>
</html>