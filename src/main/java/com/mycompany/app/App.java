package com.mycompany.app;

public class App {

    private static final String MESSAGE = "Dhyoga pernah di sini.";

    public App() {}

    public static void main(String[] args) {
        System.out.println(MESSAGE);
    }

    public String getMessage() {
        return MESSAGE;
    }
}
