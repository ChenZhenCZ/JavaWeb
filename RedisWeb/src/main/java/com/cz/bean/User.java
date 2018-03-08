package com.cz.bean;

import java.io.Serializable;

public class User implements Serializable {

    private Long id;
    private String phone;
    private String name;
    private String gender;

    public User() {
    }

    public User(String phone, String name, String gender) {
        this.phone = phone;
        this.name = name;
        this.gender = gender;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
}
