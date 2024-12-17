package org.example;


import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class Main {

    static class Person {
        String name;
        int age;
        String city;

        public Person(String name, int age, String city){
            this.name = name;
            this.age = age;
            this.city = city;
        }
    }
    public static void main(String[] args) {
        System.out.println("Hello world!");


        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        Person person = new Person("Thom Yorke", 56, "Wellingborough, UK");
        String jsonString = gson.toJson(person);
        System.out.println("Serialized JSON:");
        System.out.println(jsonString);
    }
}

