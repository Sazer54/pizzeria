package com.pizza.pizzeria15.repo;

import com.pizza.pizzeria15.entities.products.Drink;
import com.pizza.pizzeria15.entities.products.Pizza;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface DrinkRepository extends CrudRepository<Drink, Integer> {
    ArrayList<Drink> findFirst2ByOrderByRatingDesc();
    ArrayList<Drink> findAllByDayDiscounted(String dayDiscounted);
}
