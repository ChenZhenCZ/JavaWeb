package com.cz.bean;

import java.math.BigDecimal;

public class DaoWz {
    private  int id;
    private String title;
    private BigDecimal pric;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public BigDecimal getPric() {
        return pric;
    }

    public void setPric(BigDecimal pric) {
        this.pric = pric;
    }
}
