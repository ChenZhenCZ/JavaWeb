package com.cz.bean;

public class Stutden {
    private int no;
    private String name;
    private String gender;
    private String phone;

    public Stutden(){

    }
    public Stutden(int no, String name, String gender, String phone) {
        this.no = no;
        this.name = name;
        this.gender = gender;
        this.phone = phone;
    }
    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "Stutden{" +
                "no=" + no +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }
}
