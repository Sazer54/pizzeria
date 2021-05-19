package com.pizza.pizzeria15.entities.products;

import com.pizza.pizzeria15.entities.orders.OrderSauce;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Sauce {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;
    private boolean vege;
    private double price;
    @Column(columnDefinition = "double default 0")
    private double rating;
    private String dayDiscounted;

    @OneToMany(mappedBy = "sauce")
    private Set<OrderSauce> orderSauces = new HashSet<>();

    public Sauce(String name, boolean vege, double price, double rating, String dayDiscounted) {
        this.name = name;
        this.vege = vege;
        this.price = price;
        this.rating = rating;
        this.dayDiscounted = dayDiscounted;
    }

    public Sauce() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isVege() {
        return vege;
    }

    public void setVege(boolean vege) {
        this.vege = vege;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public String getDayDiscounted() {
        return dayDiscounted;
    }

    public void setDayDiscounted(String dayDiscounted) {
        this.dayDiscounted = dayDiscounted;
    }

    public Set<OrderSauce> getOrderSauces() {
        return orderSauces;
    }

    public void setOrderSauces(Set<OrderSauce> orderSauces) {
        this.orderSauces = orderSauces;
    }
}
