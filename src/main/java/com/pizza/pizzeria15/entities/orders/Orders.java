package com.pizza.pizzeria15.entities.orders;

import com.pizza.pizzeria15.entities.Cook;
import com.pizza.pizzeria15.entities.User;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.HashSet;
import java.util.Random;
import java.util.Set;

@Entity
public class Orders {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "cook_id")
    private Cook cook;

    private LocalDateTime receivedTime;
    private LocalDateTime realisedTime;

    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL)
    private Set<OrderPizza> orderPizzas = new HashSet<>();

    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL)
    private Set<OrderSauce> orderSauces = new HashSet<>();

    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL)
    private Set<OrderDrink> orderDrinks = new HashSet<>();

    @Transient
    private String formattedReceivedTime;

    @Transient
    private String formattedRealisedTime;

    @Transient
    private long preparationLength;

    public Orders(Cook cook) {
        Random random = new Random();
        this.cook = cook;
        this.receivedTime = LocalDateTime.now();
        this.realisedTime = LocalDateTime.now().plusMinutes(random.nextInt(60) + 30);
    }

    public Orders() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Cook getCook() {
        return cook;
    }

    public void setCook(Cook cook) {
        this.cook = cook;
    }

    public LocalDateTime getReceivedTime() {
        return receivedTime;
    }

    public void setReceivedTime(LocalDateTime receivedTime) {
        this.receivedTime = receivedTime;
    }

    public LocalDateTime getRealisedTime() {
        return realisedTime;
    }

    public void setRealisedTime(LocalDateTime realisedTime) {
        this.realisedTime = realisedTime;
    }

    public Set<OrderPizza> getOrderPizzas() {
        return orderPizzas;
    }

    public void setOrderPizzas(Set<OrderPizza> orderPizzas) {
        this.orderPizzas = orderPizzas;
    }

    public Set<OrderSauce> getOrderSauces() {
        return orderSauces;
    }

    public void setOrderSauces(Set<OrderSauce> orderSauces) {
        this.orderSauces = orderSauces;
    }

    public Set<OrderDrink> getOrderDrinks() {
        return orderDrinks;
    }

    public void setOrderDrinks(Set<OrderDrink> orderDrinks) {
        this.orderDrinks = orderDrinks;
    }

    public String getFormattedReceivedTime() {
        this.setFormattedReceivedTime(this.receivedTime.toString().replace('T', ' ').substring(0, this.receivedTime.toString().indexOf('.')));
        return formattedReceivedTime;
    }

    public void setFormattedReceivedTime(String formattedReceivedTime) {
        this.formattedReceivedTime = formattedReceivedTime;
    }

    public long getPreparationLength() {
        this.setPreparationLength(this.receivedTime.until(this.realisedTime, ChronoUnit.MINUTES));
        return preparationLength;
    }

    public void setPreparationLength(long preparationLength) {
        this.preparationLength = preparationLength;
    }

    public String getFormattedRealisedTime() {
        this.setFormattedRealisedTime(this.realisedTime.toString().replace('T', ' ').substring(0, this.receivedTime.toString().indexOf('.')));
        return formattedRealisedTime;
    }

    public void setFormattedRealisedTime(String formattedRealisedTime) {
        this.formattedRealisedTime = formattedRealisedTime;
    }
}
