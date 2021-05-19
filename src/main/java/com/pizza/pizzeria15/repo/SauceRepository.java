package com.pizza.pizzeria15.repo;

import com.pizza.pizzeria15.entities.products.Pizza;
import com.pizza.pizzeria15.entities.products.Sauce;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface SauceRepository extends CrudRepository<Sauce, Integer> {
    ArrayList<Sauce> findFirst2ByOrderByRatingDesc();
    ArrayList<Sauce> findAllByDayDiscounted(String dayDiscounted);
}
