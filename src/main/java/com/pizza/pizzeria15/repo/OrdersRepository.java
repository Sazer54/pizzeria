package com.pizza.pizzeria15.repo;

import com.pizza.pizzeria15.entities.orders.Orders;
import org.springframework.data.repository.CrudRepository;

import java.util.ArrayList;
import java.util.Optional;

public interface OrdersRepository extends CrudRepository<Orders, Integer> {
    Optional<ArrayList<Orders>> findAllByUserIdOrderByReceivedTimeDesc(int id);
    Optional<ArrayList<Orders>> findAllByUserId(int id);
    Integer deleteById(int id);
    Optional<Orders> findFirst1ByUserIdOrderByReceivedTimeDesc(int id);
    Integer countByUserId(int id);
}
