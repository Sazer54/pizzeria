package com.pizza.pizzeria15.repo;

import com.pizza.pizzeria15.entities.Cook;
import org.springframework.data.repository.CrudRepository;

public interface CookRepository extends CrudRepository<Cook, Integer> {
    long count();
}
