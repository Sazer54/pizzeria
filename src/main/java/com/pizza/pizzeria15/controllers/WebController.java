package com.pizza.pizzeria15.controllers;

import com.pizza.pizzeria15.entities.orders.OrderDrink;
import com.pizza.pizzeria15.entities.orders.OrderPizza;
import com.pizza.pizzeria15.entities.orders.OrderSauce;
import com.pizza.pizzeria15.entities.orders.Orders;
import com.pizza.pizzeria15.entities.products.Drink;
import com.pizza.pizzeria15.entities.products.Pizza;
import com.pizza.pizzeria15.entities.products.Sauce;
import com.pizza.pizzeria15.repo.PizzaRepository;
import com.pizza.pizzeria15.helpers.AttemptedLogin;
import com.pizza.pizzeria15.helpers.Cart;
import com.pizza.pizzeria15.entities.*;
import com.pizza.pizzeria15.repo.*;
import org.apache.tomcat.jni.Local;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Array;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Controller
public class WebController {

    private final PizzaRepository pizzaRepository;
    private final SauceRepository sauceRepository;
    private final DrinkRepository drinkRepository;
    private final UserRepository userRepository;
    private final OrdersRepository ordersRepository;
    private final OrderPizzaRepository orderPizzaRepository;
    private final OrderSauceRepository orderSauceRepository;
    private final OrderDrinkRepository orderDrinkRepository;
    private final CookRepository cookRepository;
    private final TitleRepository titleRepository;
    private User currentUser;
    private Orders currentOrder;
    private Cart cart;
    private List<Pizza> pizzasOfTheDay;
    private Sauce sauceOfTheDay;
    private Drink drinkOfTheDay;

    @Autowired
    public WebController(PizzaRepository pizzaRepository, SauceRepository sauceRepository, DrinkRepository drinkRepository,
                         UserRepository userRepository,OrdersRepository ordersRepository, OrderPizzaRepository orderPizzaRepository,
                         OrderSauceRepository orderSauceRepository, OrderDrinkRepository orderDrinkRepository,
                         CookRepository cookRepository, TitleRepository titleRepository) {
        this.pizzaRepository = pizzaRepository;
        this.sauceRepository = sauceRepository;
        this.drinkRepository = drinkRepository;
        this.userRepository = userRepository;
        this.ordersRepository = ordersRepository;
        this.orderPizzaRepository = orderPizzaRepository;
        this.orderSauceRepository = orderSauceRepository;
        this.orderDrinkRepository = orderDrinkRepository;
        this.cookRepository = cookRepository;
        this.titleRepository = titleRepository;
        this.cart = new Cart();
        this.assessDailies();
    }

    private void assessDailies(){
        Random random = new Random();
        pizzasOfTheDay = new ArrayList<>();
        pizzaRepository.findAllByDayDiscounted(LocalDate.now().getDayOfWeek().toString()).forEach(pizzasOfTheDay::add);
        List<Sauce> discountedSauces = sauceRepository.findAllByDayDiscounted(LocalDate.now().getDayOfWeek().toString());
        sauceOfTheDay = discountedSauces.get(random.nextInt(discountedSauces.size()));
        List<Drink> discountedDrinks = drinkRepository.findAllByDayDiscounted(LocalDate.now().getDayOfWeek().toString());
        drinkOfTheDay = discountedDrinks.get(random.nextInt(discountedDrinks.size()));
    }

    @GetMapping("/")
    public String redirectToHome() {
        return "redirect:/home";
    }

    @GetMapping("/home")
    public String getHome(Model model) {
        model.addAttribute("currentUser", this.currentUser);
        model.addAttribute("favPizzaList", pizzaRepository.findFirst3ByOrderByRatingDesc());
        model.addAttribute("pizzasOfTheDay", pizzasOfTheDay);
        model.addAttribute("sauceOfTheDay", sauceOfTheDay);
        model.addAttribute("drinkOfTheDay", drinkOfTheDay);
        if (currentUser != null) {
            if (ordersRepository.findFirst1ByUserIdOrderByReceivedTimeDesc(currentUser.getId()).isPresent()) {
                model.addAttribute("lastOrder", ordersRepository.findFirst1ByUserIdOrderByReceivedTimeDesc(currentUser.getId()).get());
            }
        }
        return "home";
    }

    @GetMapping("/divideBy0")
    public void divideByZero() {
        System.out.println(2/0);
    }

    @GetMapping("/order")
    public String getOrder(Model model) {
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("pizzaList", pizzaRepository.findAll());
        model.addAttribute("sauceList", sauceRepository.findAll());
        model.addAttribute("drinkList", drinkRepository.findAll());
        model.addAttribute("pizzasOfTheDay", pizzasOfTheDay);
        model.addAttribute("sauceOfTheDay", sauceOfTheDay);
        model.addAttribute("drinkOfTheDay", drinkOfTheDay);
        return "order";
    }

    @GetMapping("/logout")
    public String logout() {
        this.currentUser = null;
        this.currentOrder = null;
        return "redirect:/home";
    }

    @GetMapping("/login")
    public String loginPage(@ModelAttribute("incorrectLoginMessage") String incorrectLoginMessage,
                            @ModelAttribute("incorrectPasswordMessage") String incorrectPasswordMessage,
                            @ModelAttribute("newlyRegistered") String newlyRegistered,
                            @ModelAttribute("redirectedFromCart") String redirectedFromCart, Model model) {
        model.addAttribute("currentUser", currentUser);
        return "login";
    }

    private String hash(String password) throws NoSuchAlgorithmException {
        String salt = "E1F53135E559C253";
        password += salt;
        MessageDigest messageDigest = MessageDigest.getInstance("MD5");
        messageDigest.update(password.getBytes());
        byte[] resultByteArray = messageDigest.digest();
        StringBuilder sb = new StringBuilder();
        for (byte b : resultByteArray){
            sb.append(String.format("%02x", b));
        }
        return sb.toString();
    }

    @PostMapping("/login")
    public String loginAttempt(Model model, @ModelAttribute("attemptedLogin") AttemptedLogin attemptedLogin,
                               RedirectAttributes redirectAttributes) throws NoSuchAlgorithmException {
        if (userRepository.findByLogin(attemptedLogin.getLogin()).isPresent()) {
            if (userRepository.findByLoginAndPassword(attemptedLogin.getLogin(), this.hash(attemptedLogin.getPassword())).isPresent()) {
                this.currentUser = userRepository.findByLoginAndPassword(attemptedLogin.getLogin(), this.hash(attemptedLogin.getPassword())).get();
                if (currentOrder != null) {
                    currentOrder.setUser(currentUser);
                }
                if (this.cart.getOrderPizzas().size() != 0 || this.cart.getOrderSauces().size() != 0 || this.cart.getOrderDrinks().size() != 0){
                    return "redirect:/cart";
                }
                model.addAttribute("currentUser", currentUser);
                return "redirect:/home";
            }
            redirectAttributes.addFlashAttribute("wrongPasswordMessage", "Incorrect password");
            return "redirect:login";
        }
        redirectAttributes.addFlashAttribute("noLoginFoundMessage", "Login doesn't exist");
        return "redirect:login";
    }

    @GetMapping("/myprofile")
    public String showProfile(Model model) {
        if (this.currentUser == null) {
            return "redirect:/login";
        }
        model.addAttribute("currentUser", this.currentUser);
        model.addAttribute("orders", ordersRepository.findAllByUserIdOrderByReceivedTimeDesc(currentUser.getId()).get());
        return "profile";
    }

    @GetMapping("/myprofile/change/name")
    public String changeUserNameGet(Model model) {
        model.addAttribute("currentUser", this.currentUser);
        return "changeName";
    }

    @PostMapping("/myprofile/change/name")
    public String changeUserNamePost(@ModelAttribute("firstName") String fName, @ModelAttribute("lastName") String lName) {
        currentUser.setFirstName(fName);
        currentUser.setLastName(lName);
        userRepository.save(currentUser);
        return "redirect:/myprofile";
    }

    @GetMapping("/myprofile/change/phone")
    public String changeUserPhoneGet(Model model) {
        model.addAttribute("currentUser", this.currentUser);
        return "changePhone";
    }

    @PostMapping("/myprofile/change/phone")
    public String changeUserPhonePost(@ModelAttribute("phone") String phone) {
        currentUser.setPhone(phone);
        userRepository.save(currentUser);
        return "redirect:/myprofile";
    }

    @GetMapping("/myprofile/change/email")
    public String changeUserEmailGet(Model model) {
        model.addAttribute("currentUser", this.currentUser);
        return "changeEmail";
    }

    @PostMapping("/myprofile/change/email")
    public String changeUserEmailPost(@ModelAttribute("email") String email) {
        currentUser.setEmail(email);
        userRepository.save(currentUser);
        return "redirect:/myprofile";
    }

    @GetMapping("/myprofile/change/password")
    public String changeUserPasswordGet(Model model) {
        model.addAttribute("currentUser", this.currentUser);
        return "changePassword";
    }

    @PostMapping("/myprofile/change/password")
    public String changeUserPasswordPost(@ModelAttribute("password1") String password) throws NoSuchAlgorithmException {
        currentUser.setPassword(hash(password));
        userRepository.save(currentUser);
        return "redirect:/myprofile";
    }

    @GetMapping("myprofile/change/address")
    public String changeUserAddressGet(Model model) {
        model.addAttribute("currentUser", this.currentUser);
        return "changeAddress";
    }

    @PostMapping("/myprofile/change/address")
    public String changeUserAddressPost(@ModelAttribute("city") String city, @ModelAttribute("postalCode") String postalCode,
                                        @ModelAttribute("address") String address) {
        currentUser.setCity(city);
        currentUser.setPostalCode(postalCode);
        currentUser.setAddress(address);
        userRepository.save(currentUser);
        return "redirect:/myprofile";
    }

    @GetMapping("/register")
    public String registrationPage(Model model) {
        model.addAttribute("currentUser", currentUser);
        return "register";
    }

    @PostMapping("/register")
    public String registerNewUser(@ModelAttribute("login") String login, @ModelAttribute("firstName") String firstName,
                                  @ModelAttribute("lastName") String lastName, @ModelAttribute("phone") String phone,
                                  @ModelAttribute("email") String email, @ModelAttribute("password") String password,
                                  @ModelAttribute("city") String city, @ModelAttribute("postalCode") String postalCode,
                                  @ModelAttribute("address") String address, Model model,
                                  RedirectAttributes redirectAttributes) throws NoSuchAlgorithmException {
        if (userRepository.findByLogin(login).isPresent()) {
            model.addAttribute("repeatedLogin", true);
            return "register";
        }
        User newUser = new User(firstName, lastName, email, phone, login, this.hash(password), city, postalCode, address);
        userRepository.save(newUser);
        redirectAttributes.addFlashAttribute("newlyRegistered", "Successfully registered!");

        return "redirect:/login";
    }

    @GetMapping("/deleteaccount")
    public String deleteAccount(Model model) {
        List<Orders> userOrders = new ArrayList<>();
        if (ordersRepository.findAllByUserId(currentUser.getId()).isPresent()) {
            ordersRepository.findAllByUserId(currentUser.getId()).get().forEach(userOrders::add);
        }
        for (Orders currentOrder : userOrders) {
            for (OrderPizza orderPizza : currentOrder.getOrderPizzas()) {
                orderPizzaRepository.deleteById(orderPizza.getId());
            }
            for (OrderSauce orderSauce : currentOrder.getOrderSauces()) {
                orderSauceRepository.deleteById(orderSauce.getId());
            }
            for (OrderDrink orderDrink : currentOrder.getOrderDrinks()) {
                orderDrinkRepository.deleteById(orderDrink.getId());
            }
            ordersRepository.deleteById(currentOrder.getId());
        }
        this.userRepository.deleteById(this.currentUser.getId());
        model.addAttribute("currentUser", currentUser);
        return "deleted";
    }

    @PostMapping("/addtocart/{type}/{id}")
    public String addItemToCart(@PathVariable(name = "type") String type, @PathVariable(name = "id") int id) {
        if (this.currentOrder == null) {
            Random rand = new Random();
            List<Cook> allCooks = new ArrayList<>();
            cookRepository.findAll().forEach(allCooks::add);
            Cook randomlyAssignedCook = allCooks.get(rand.nextInt(allCooks.size()));
            currentOrder = new Orders(randomlyAssignedCook);
            currentOrder.setUser(currentUser);
        }
        switch (type) {
            case "pizza":
                if (this.cart.hasOrderPizzaOfPizzaId(id)) {
                    this.cart.getOrderPizzaByPizzaId(id).addQuantity();
                } else {
                    Pizza orderedPizza = this.pizzaRepository.findById(id).get();
                    boolean boughtOnDiscount;
                    if (LocalDate.now().getDayOfWeek().toString().equals(orderedPizza.getDayDiscounted())){
                        boughtOnDiscount = true;
                    } else {
                        boughtOnDiscount = false;
                    }
                    OrderPizza newOrderPizza = new OrderPizza(1, orderedPizza, this.currentOrder, boughtOnDiscount);
                    this.cart.addOrderPizza(newOrderPizza);
                }
                break;
            case "sauce":
                if (this.cart.hasOrderSauceOfSauceId(id)) {
                    this.cart.getOrderSauceBySauceId(id).addQuantity();
                } else {
                    Sauce orderedSauce = this.sauceRepository.findById(id).get();
                    boolean boughtOnDiscount;
                    if (LocalDate.now().getDayOfWeek().toString().equals(orderedSauce.getDayDiscounted())){
                        boughtOnDiscount = true;
                    } else {
                        boughtOnDiscount = false;
                    }
                    OrderSauce newOrderSauce = new OrderSauce(1, orderedSauce, this.currentOrder, boughtOnDiscount);
                    this.cart.addOrderSauce(newOrderSauce);
                }
                break;
            case "drink":
                if (this.cart.hasOrderDrinkOfDrinkId(id)) {
                    this.cart.getOrderDrinkByDrinkId(id).addQuantity();
                } else {

                    Drink orderedDrink = this.drinkRepository.findById(id).get();
                    boolean boughtOnDiscount;
                    if (LocalDate.now().getDayOfWeek().toString().equals(orderedDrink.getDayDiscounted())){
                        boughtOnDiscount = true;
                    } else {
                        boughtOnDiscount = false;
                    }
                    OrderDrink newOrderDrink = new OrderDrink(1, orderedDrink, this.currentOrder, boughtOnDiscount);
                    this.cart.addOrderDrink(newOrderDrink);
                }
                break;
            default:
                System.out.println("XD");
                break;
        }
        return null;
    }

    @PostMapping("/removefromcart/{type}/{id}")
    public void removeFromCart(@PathVariable("type") String type, @PathVariable("id") int id) {
        if (currentOrder == null) {
            return;
        }
        switch(type) {
            case "pizza":
                if (this.cart.hasOrderPizzaOfPizzaId(id)) {
                    this.cart.getOrderPizzaByPizzaId(id).subtractQuantity();
                    if (this.cart.getOrderPizzaByPizzaId(id).getPizzaQuantity() == 0) {
                        this.cart.removeOrderPizzaByPizzaId(id);
                        this.removeOrderIfCartEmpty();
                    }
                }
                break;
            case "sauce":
                if (this.cart.hasOrderSauceOfSauceId(id)) {
                    this.cart.getOrderSauceBySauceId(id).subtractQuantity();
                    if (this.cart.getOrderSauceBySauceId(id).getSauceQuantity() == 0) {
                        this.cart.removeOrderSauceBySauceId(id);
                        this.removeOrderIfCartEmpty();
                    }
                }
                break;
            case "drink":
                if (this.cart.hasOrderDrinkOfDrinkId(id)) {
                    this.cart.getOrderDrinkByDrinkId(id).subtractQuantity();
                    if (this.cart.getOrderDrinkByDrinkId(id).getDrinkQuantity() == 0) {
                        this.cart.removeOrderDrinkByDrinkId(id);
                        this.removeOrderIfCartEmpty();
                    }
                }
                break;
            default:
                System.out.println("XD");
                break;
        }
    }

    private void removeOrderIfCartEmpty() {
        if (this.cart.getOrderDrinks().isEmpty() && this.cart.getOrderSauces().isEmpty() && this.cart.getOrderPizzas().isEmpty()) {
            this.currentOrder = null;
        }
    }

    @GetMapping("/cart")
    public String showCart(Model model) {
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("order", this.currentOrder);
        model.addAttribute("cart", this.cart);
        return "cart";
    }

    @GetMapping("/cancelorder")
    public String cancelOrder(HttpServletRequest request) {
        this.cart = new Cart();
        this.currentOrder = null;
        /*String referer = request.getHeader("Referer");
        System.out.println("referer is : " + referer);*/
        return "redirect:/home";
    }

    @GetMapping("/completeorder")
    public String completeOrder(Model model, RedirectAttributes redirectAttributes) {
        model.addAttribute("currentUser", currentUser);
        if (this.cart.getOrderPizzas().isEmpty() && this.cart.getOrderSauces().isEmpty() && this.cart.getOrderDrinks().isEmpty()) {
            model.addAttribute("emptyCart", true);
            return "redirect:/cart";
        }
        if (currentUser == null) {
            redirectAttributes.addFlashAttribute("redirectedFromCart", "Login to place an order");
            return "redirect:/login";
        }
        this.currentOrder.setUser(currentUser);
        this.ordersRepository.save(currentOrder);
        if (!this.cart.getOrderPizzas().isEmpty()) {
            for (OrderPizza orderPizza : this.cart.getOrderPizzas()) {
                this.orderPizzaRepository.save(orderPizza);
            }
        }
        if (!this.cart.getOrderSauces().isEmpty()) {
            for (OrderSauce orderSauce : this.cart.getOrderSauces()) {
                this.orderSauceRepository.save(orderSauce);
            }
        }
        if (!this.cart.getOrderDrinks().isEmpty()) {
            for (OrderDrink orderDrink : this.cart.getOrderDrinks()) {
                this.orderDrinkRepository.save(orderDrink);
            }
        }
        model.addAttribute("order", this.currentOrder);
        this.currentOrder = null;
        this.cart = new Cart();
        model.addAttribute("orderNumber", this.ordersRepository.countByUserId(this.currentUser.getId()));
        return "/completedOrder";
    }

    @GetMapping("/reorder/last")
    public String reorderLast() {
        if (ordersRepository.findFirst1ByUserIdOrderByReceivedTimeDesc(this.currentUser.getId()).isPresent()){
            int lastOrderId = ordersRepository.findFirst1ByUserIdOrderByReceivedTimeDesc(this.currentUser.getId()).get().getId();
            return "redirect:/reorder/id/" + lastOrderId;
        }
        return "redirect:/home";
    }

    @GetMapping("/reorder/id/{id}")
    public String reorderById(@PathVariable("id") int id) {
        System.out.println("ID: " + id);
        this.cart = new Cart();
        Random rand = new Random();
        List<Cook> allCooks = new ArrayList<>();
        cookRepository.findAll().forEach(allCooks::add);
        Cook randomlyAssignedCook = allCooks.get(rand.nextInt(allCooks.size()));
        currentOrder = new Orders(randomlyAssignedCook);
        currentOrder.setUser(currentUser);
        Orders selectedOrder = ordersRepository.findById(id).get();

        for (OrderPizza orderPizza : selectedOrder.getOrderPizzas()) {
            this.cart.addOrderPizza(new OrderPizza(orderPizza.getPizzaQuantity(), orderPizza.getPizza(), currentOrder, orderPizza.isBoughtOnDiscount()));
        }
        for (OrderSauce orderSauce : selectedOrder.getOrderSauces()) {
            this.cart.addOrderSauce(new OrderSauce(orderSauce.getSauceQuantity(), orderSauce.getSauce(), currentOrder, orderSauce.isBoughtOnDiscount()));
        }
        for (OrderDrink orderDrink : selectedOrder.getOrderDrinks()) {
            this.cart.addOrderDrink(new OrderDrink(orderDrink.getDrinkQuantity(), orderDrink.getDrink(), currentOrder, orderDrink.isBoughtOnDiscount()));
        }
        return "redirect:/cart";
    }
}
