package com.cz.bean;

import com.opencsv.bean.CsvBindByName;

public class Contract {

    @CsvBindByName
    private String id;
    @CsvBindByName(column = "contract_name")
    private String name;
    @CsvBindByName
    private String phone;
    @CsvBindByName
    private String company;
    @CsvBindByName
    private String address;

    public Contract(String id, String name, String phone, String company, String address) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.company = company;
        this.address = address;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Contract{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", company='" + company + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}
