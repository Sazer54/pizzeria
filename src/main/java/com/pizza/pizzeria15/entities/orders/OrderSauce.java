package com.pizza.pizzeria15.entities.orders;

import com.pizza.pizzeria15.entities.products.Sauce;

import javax.persistence.*;

@Entity
public class OrderSauce {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "sauce_id")
    private Sauce sauce;

    @ManyToOne
    @JoinColumn(name = "order_id")
    private Orders order;

    private Integer sauceQuantity;
    private boolean boughtOnDiscount;

    public OrderSauce(Integer sauceQuantity, Sauce sauce, Orders order, boolean boughtOnDiscount) {
        this.sauce = sauce;
        this.order = order;
        this.sauceQuantity = sauceQuantity;
        this.boughtOnDiscount = boughtOnDiscount;
    }

    public OrderSauce() {
    }

    public void addQuantity() {
        this.sauceQuantity++;
    }

    public void subtractQuantity() {
        this.sauceQuantity--;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Sauce getSauce() {
        return sauce;
    }

    public void setSauce(Sauce sauce) {
        this.sauce = sauce;
    }

    public Orders getOrder() {
        return order;
    }

    public void setOrder(Orders order) {
        this.order = order;
    }

    public Integer getSauceQuantity() {
        return sauceQuantity;
    }

    public void setSauceQuantity(Integer sauceQuantity) {
        this.sauceQuantity = sauceQuantity;
    }

    public boolean isBoughtOnDiscount() {
        return boughtOnDiscount;
    }

    public void setBoughtOnDiscount(boolean boughtOnDiscount) {
        this.boughtOnDiscount = boughtOnDiscount;
    }
}
