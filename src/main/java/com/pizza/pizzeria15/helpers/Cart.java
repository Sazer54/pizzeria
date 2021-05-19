package com.pizza.pizzeria15.helpers;

import com.pizza.pizzeria15.entities.orders.OrderDrink;
import com.pizza.pizzeria15.entities.orders.OrderPizza;
import com.pizza.pizzeria15.entities.orders.OrderSauce;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private List<OrderPizza> orderPizzas;
    private List<OrderSauce> orderSauces;
    private List<OrderDrink> orderDrinks;

    public Cart() {
        this.orderPizzas = new ArrayList<>();
        this.orderSauces = new ArrayList<>();
        this.orderDrinks = new ArrayList<>();
    }

    public void addOrderPizza(OrderPizza orderPizza) {
        this.orderPizzas.add(orderPizza);
    }

    public void addOrderSauce(OrderSauce orderSauce) {
        this.orderSauces.add(orderSauce);
    }

    public void addOrderDrink(OrderDrink orderDrink) {
        this.orderDrinks.add(orderDrink);
    }

    public void removeOrderPizzaByPizzaId(int id) {
        for (OrderPizza orderPizza : this.orderPizzas) {
            if (orderPizza.getPizza().getId() == id) {
                this.orderPizzas.remove(orderPizza);
                break;
            }
        }
    }

    public void removeOrderSauceBySauceId(int id) {
        for (OrderSauce orderSauce : this.orderSauces) {
            if (orderSauce.getSauce().getId() == id) {
                this.orderSauces.remove(orderSauce);
                break;
            }
        }
    }

    public void removeOrderDrinkByDrinkId(int id) {
        for (OrderDrink orderDrink : this.orderDrinks) {
            if (orderDrink.getDrink().getId() == id) {
                this.orderDrinks.remove(orderDrink);
                break;
            }
        }
    }

    public boolean hasOrderPizzaOfPizzaId(int id) {
        if (!this.orderPizzas.isEmpty()) {
            for (OrderPizza orderPizza : this.orderPizzas) {
                if (orderPizza.getPizza().getId() == id) return true;
            }
        }
        return false;
    }
    public boolean hasOrderSauceOfSauceId(int id) {
        if (!this.orderSauces.isEmpty()) {
            for (OrderSauce orderSauce : this.orderSauces) {
                if (orderSauce.getSauce().getId() == id) return true;
            }
        }
        return false;
    }

    public boolean hasOrderDrinkOfDrinkId(int id) {
        if (!this.orderDrinks.isEmpty()) {
            for (OrderDrink orderDrink : this.orderDrinks) {
                if (orderDrink.getDrink().getId() == id) return true;
            }
        }
        return false;
    }

    public OrderPizza getOrderPizzaByPizzaId(int id) {
        for (OrderPizza orderPizza : this.orderPizzas) {
            if (orderPizza.getPizza().getId() == id) {
                return orderPizza;
            }
        }
        return null;
    }

    public OrderSauce getOrderSauceBySauceId(int id) {
        for (OrderSauce orderSauce : this.orderSauces) {
            if (orderSauce.getSauce().getId() == id) {
                return orderSauce;
            }
        }
        return null;
    }

    public OrderDrink getOrderDrinkByDrinkId(int id) {
        for (OrderDrink orderDrink : this.orderDrinks) {
            if (orderDrink.getDrink().getId() == id) {
                return orderDrink;
            }
        }
        return null;
    }

    public List<OrderPizza> getOrderPizzas() {
        return orderPizzas;
    }

    public void setOrderPizzas(List<OrderPizza> orderPizzas) {
        this.orderPizzas = orderPizzas;
    }

    public List<OrderSauce> getOrderSauces() {
        return orderSauces;
    }

    public void setOrderSauces(List<OrderSauce> orderSauces) {
        this.orderSauces = orderSauces;
    }

    public List<OrderDrink> getOrderDrinks() {
        return orderDrinks;
    }

    public void setOrderDrinks(List<OrderDrink> orderDrinks) {
        this.orderDrinks = orderDrinks;
    }
}
