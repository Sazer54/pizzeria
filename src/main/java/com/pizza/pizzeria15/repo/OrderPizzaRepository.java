package com.pizza.pizzeria15.repo;

import com.pizza.pizzeria15.entities.orders.OrderPizza;
import org.springframework.data.repository.CrudRepository;

public interface OrderPizzaRepository extends CrudRepository<OrderPizza, Integer> {
}
