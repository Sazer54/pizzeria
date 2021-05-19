package com.pizza.pizzeria15.repo;

import com.pizza.pizzeria15.entities.User;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface UserRepository extends CrudRepository<User, Integer> {
    Optional<User> findByLogin(String login);
    Optional<User> findByLoginAndPassword(String login, String password);
    Optional<User> getOne(int id);
    Integer deleteById(int id);
}
