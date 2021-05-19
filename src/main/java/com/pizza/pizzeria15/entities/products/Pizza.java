package com.pizza.pizzeria15.entities.products;

import com.pizza.pizzeria15.entities.orders.OrderPizza;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Pizza {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;
    private String description;
    private boolean vege;
    private double price;
    @Column(columnDefinition = "double default 0")
    private double rating;
    private String dayDiscounted;
    private String imgPath;

    @OneToMany(mappedBy = "pizza")
    private Set<OrderPizza> orderPizzas = new HashSet<>();

    public Pizza(String name, String description, boolean vege, double price, double rating, String dayDiscounted, String imgPath) {
        this.name = name;
        this.description = description;
        this.vege = vege;
        this.price = price;
        this.rating = rating;
        this.dayDiscounted = dayDiscounted;
        this.imgPath = imgPath;
    }

    public Pizza() { }

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

    public Set<OrderPizza> getOrderPizzas() {
        return orderPizzas;
    }

    public void setOrderPizzas(Set<OrderPizza> orderPizzas) {
        this.orderPizzas = orderPizzas;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }
}
