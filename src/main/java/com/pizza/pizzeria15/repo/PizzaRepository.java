package com.pizza.pizzeria15.repo;

import com.pizza.pizzeria15.entities.products.Pizza;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface PizzaRepository extends CrudRepository<Pizza, Integer> {
    ArrayList<Pizza> findFirst3ByOrderByRatingDesc();
    ArrayList<Pizza> findAllByDayDiscounted(String dayDiscounted);
}
