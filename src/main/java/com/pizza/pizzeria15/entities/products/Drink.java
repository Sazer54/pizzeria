package com.pizza.pizzeria15.entities.products;

import com.pizza.pizzeria15.entities.orders.OrderDrink;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Drink {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;
    private double price;
    @Column(columnDefinition = "double default 0")
    private double rating;
    private String dayDiscounted;

    @OneToMany(mappedBy = "drink")
    private Set<OrderDrink> orderDrinks = new HashSet<>();

    public Drink(String name, double price, double rating, String dayDiscounted) {
        this.name = name;
        this.price = price;
        this.rating = rating;
        this.dayDiscounted = dayDiscounted;
    }

    public Drink() {
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

    public Set<OrderDrink> getOrderDrinks() {
        return orderDrinks;
    }

    public void setOrderDrinks(Set<OrderDrink> orderDrinks) {
        this.orderDrinks = orderDrinks;
    }
}
