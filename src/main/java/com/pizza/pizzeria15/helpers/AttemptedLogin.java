package com.pizza.pizzeria15.helpers;

public class AttemptedLogin {
    private String login;
    private String password;

    public AttemptedLogin(String login, String password) {
        this.login = login;
        this.password = password;
    }

    public AttemptedLogin() {
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
