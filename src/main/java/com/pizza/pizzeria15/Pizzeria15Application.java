package com.pizza.pizzeria15;

import com.pizza.pizzeria15.entities.orders.OrderDrink;
import com.pizza.pizzeria15.entities.orders.OrderPizza;
import com.pizza.pizzeria15.entities.orders.OrderSauce;
import com.pizza.pizzeria15.entities.orders.Orders;
import com.pizza.pizzeria15.entities.products.Drink;
import com.pizza.pizzeria15.entities.products.Pizza;
import com.pizza.pizzeria15.entities.products.Sauce;
import com.pizza.pizzeria15.repo.PizzaRepository;
import com.pizza.pizzeria15.entities.*;
import com.pizza.pizzeria15.repo.*;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class Pizzeria15Application {

	public static void main(String[] args) {
		SpringApplication.run(Pizzeria15Application.class, args);
	}

	@Bean
	public CommandLineRunner runApplication(PizzaRepository pizzaRepository, SauceRepository sauceRepository, DrinkRepository drinkRepository,
											UserRepository userRepository, OrdersRepository ordersRepository, OrderPizzaRepository orderPizzaRepository,
											OrderSauceRepository orderSauceRepository, OrderDrinkRepository orderDrinkRepository,
											CookRepository cookRepository, TitleRepository titleRepository) {
		return (args -> {
			/*addRandomPizzas(pizzaRepository);
			addRandomDrinks(drinkRepository);
			addRandomSauces(sauceRepository);
			addRandomUsers(userRepository);
			addRandomTitles(titleRepository);
			addRandomCooks(cookRepository);
			addRandomOrders(ordersRepository, pizzaRepository, orderPizzaRepository, sauceRepository, orderSauceRepository,
					drinkRepository, orderDrinkRepository);*/
		});
	}

	/*private void addRandomPizzas(PizzaRepository pizzaRepository) {
		Pizza pizzaOne = new Pizza("pizdarita", "pizdowata", true, 20.09, 10);
		pizzaRepository.save(pizzaOne);

		Pizza pizzaTwo = new Pizza("gownorita", "gowniana", true, 0.07, 9);
		pizzaRepository.save(pizzaTwo);

		Pizza pizzaThree = new Pizza("ciparita", "cipowata", false, 420.69, 8);
		pizzaRepository.save(pizzaThree);

		Pizza pizzaFour = new Pizza("srakarita", "wysrana", true, 450.01, 7);
		pizzaRepository.save(pizzaFour);
	}

	private void addRandomSauces(SauceRepository sauceRepository) {
		Sauce sauceOne = new Sauce("sosowy", false, 2.99, 0);
		sauceRepository.save(sauceOne);

		Sauce sauceTwo = new Sauce("niesosowy", true, 2.98, 1);
		sauceRepository.save(sauceTwo);

		Sauce sauceThree = new Sauce("podsosowy", false, 0.01, 2);
		sauceRepository.save(sauceThree);

		Sauce sauceFour = new Sauce("nadsosowy", true, 8.23, 3);
		sauceRepository.save(sauceFour);
	}

	private void addRandomDrinks(DrinkRepository drinkRepository) {
		Drink drinkOne = new Drink("Piss", 20.02, 5);
		Drink drinkTwo = new Drink("Semen", 10.02, 6);
		Drink drinkThree = new Drink("Goo", 0.02, 7);
		Drink drinkFour = new Drink("Liquid shit", 5.01, 8);

		drinkRepository.save(drinkOne);
		drinkRepository.save(drinkTwo);
		drinkRepository.save(drinkThree);
		drinkRepository.save(drinkFour);
	}

	private void addRandomUsers(UserRepository userRepository) {
		User userOne = new User("Szymon", "Skowronski", "emialSzymona", "telefonSzymona", "loginszymona", "hasloszymona");
		User userTwo = new User("Jacek", "Szwed", "emialJacka", "telefonJacka", "loginjacka", "haslojacka");

		userRepository.save(userOne);
		userRepository.save(userTwo);
	}

	private void addRandomOrders(OrdersRepository orderRepository, PizzaRepository pizzaRepository,
								 OrderPizzaRepository orderPizzaRepository, SauceRepository sauceRepository,
								 OrderSauceRepository orderSauceRepository, DrinkRepository drinkRepository,
								 OrderDrinkRepository orderDrinkRepository) {
		Orders orderOne = new Orders(2);
		Orders orderTwo = new Orders(1);
		orderOne.setUserId(1);
		orderTwo.setUserId(2);

		Pizza pizzaOne = pizzaRepository.findById(1).get();
		Pizza pizzaTwo = pizzaRepository.findById(2).get();
		Sauce sauceOne = sauceRepository.findById(1).get();
		Sauce sauceTwo = sauceRepository.findById(2).get();
		Drink drinkOne = drinkRepository.findById(1).get();
		//Drink drinkTwo = drinkRepository.findById(2).get();

		OrderPizza orderPizzaOne = new OrderPizza(2, pizzaOne, orderOne);
		OrderPizza orderPizzaTwo = new OrderPizza(1, pizzaTwo, orderOne);
		OrderPizza orderPizzaThree = new OrderPizza(1, pizzaOne, orderTwo);

		OrderSauce orderSauce = new OrderSauce(2, sauceOne, orderOne);
		OrderSauce orderSauceTwo = new OrderSauce(1, sauceOne, orderTwo);
		OrderSauce orderSauceThree = new OrderSauce(3, sauceTwo, orderTwo);

		OrderDrink orderDrink = new OrderDrink(1, drinkOne, orderOne);


		orderRepository.save(orderOne);
		orderRepository.save(orderTwo);
		orderPizzaRepository.save(orderPizzaOne);
		orderPizzaRepository.save(orderPizzaTwo);
		orderPizzaRepository.save(orderPizzaThree);
		orderSauceRepository.save(orderSauce);
		orderSauceRepository.save(orderSauceTwo);
		orderSauceRepository.save(orderSauceThree);
		orderDrinkRepository.save(orderDrink);
	}


	private void addRandomCooks(CookRepository cookRepository) {
		Cook cookOne = new Cook("Kacper", "Kwiatkowski", 1, "kacper@sraka.pl", "666 666 666");
		Cook cookTwo = new Cook("Bartlomiej", "Banaszak", 2, "bartlomiej@sraka.pl", "669 669 669");

		cookRepository.save(cookOne);
		cookRepository.save(cookTwo);
	}

	private void addRandomTitles(TitleRepository titleRepository) {
		Title titleOne = new Title("Gej");
		Title titleTwo = new Title("GiGaGej");

		titleRepository.save(titleOne);
		titleRepository.save(titleTwo);
	}*/

}
