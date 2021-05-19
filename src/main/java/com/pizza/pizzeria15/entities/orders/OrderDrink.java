package com.pizza.pizzeria15.entities.orders;

import com.pizza.pizzeria15.entities.products.Drink;

import javax.persistence.*;

@Entity
public class OrderDrink {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "drink_id")
    private Drink drink;

    @ManyToOne
    @JoinColumn(name = "order_id")
    private Orders order;
    private Integer drinkQuantity;
    private boolean boughtOnDiscount;

    public OrderDrink(Integer drinkQuantity, Drink drink, Orders order, boolean boughtOnDiscount) {
        this.drink = drink;
        this.order = order;
        this.drinkQuantity = drinkQuantity;
        this.boughtOnDiscount = boughtOnDiscount;
    }

    public OrderDrink() {
    }

    public void addQuantity() {
        this.drinkQuantity++;
    }

    public void subtractQuantity() {
        this.drinkQuantity--;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Drink getDrink() {
        return drink;
    }

    public void setDrink(Drink drink) {
        this.drink = drink;
    }

    public Orders getOrder() {
        return order;
    }

    public void setOrder(Orders order) {
        this.order = order;
    }

    public Integer getDrinkQuantity() {
        return drinkQuantity;
    }

    public void setDrinkQuantity(Integer drinkQuantity) {
        this.drinkQuantity = drinkQuantity;
    }

    public boolean isBoughtOnDiscount() {
        return boughtOnDiscount;
    }

    public void setBoughtOnDiscount(boolean boughtOnDiscount) {
        this.boughtOnDiscount = boughtOnDiscount;
    }
}
