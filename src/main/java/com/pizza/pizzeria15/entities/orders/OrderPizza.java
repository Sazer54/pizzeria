package com.pizza.pizzeria15.entities.orders;

import com.pizza.pizzeria15.entities.products.Pizza;

import javax.persistence.*;

@Entity
public class OrderPizza {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private Integer pizzaQuantity;

    @ManyToOne
    @JoinColumn(name = "pizza_id")
    private Pizza pizza;

    @ManyToOne
    @JoinColumn(name = "order_id")
    private Orders order;

    private boolean boughtOnDiscount;

    public OrderPizza(Integer pizzaQuantity, Pizza pizza, Orders order, boolean boughtOnDiscount) {
        this.pizzaQuantity = pizzaQuantity;
        this.pizza = pizza;
        this.order = order;
        this.boughtOnDiscount = boughtOnDiscount;
    }

    public OrderPizza() {
    }

    public void addQuantity() {
        this.pizzaQuantity++;
    }

    public void subtractQuantity() {
        this.pizzaQuantity--;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPizzaQuantity() {
        return pizzaQuantity;
    }

    public void setPizzaQuantity(Integer pizzaQuantity) {
        this.pizzaQuantity = pizzaQuantity;
    }

    public Pizza getPizza() {
        return pizza;
    }

    public void setPizza(Pizza pizza) {
        this.pizza = pizza;
    }

    public Orders getOrder() {
        return order;
    }

    public void setOrder(Orders order) {
        this.order = order;
    }

    public boolean isBoughtOnDiscount() {
        return boughtOnDiscount;
    }

    public void setBoughtOnDiscount(boolean boughtOnDiscount) {
        this.boughtOnDiscount = boughtOnDiscount;
    }
}

