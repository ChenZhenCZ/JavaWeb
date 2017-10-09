package com.cz.bean;

public class UserWz {
    private int id;
    private  String name;
    private  String password;
    private  String hone;
    private  IngWz  ingWz;
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getHone() {
        return hone;
    }

    public void setHone(String hone) {
        this.hone = hone;
    }

    public IngWz getIngWz() {
        return ingWz;
    }

    public void setIngWz(IngWz ingWz) {
        this.ingWz = ingWz;
    }
}
