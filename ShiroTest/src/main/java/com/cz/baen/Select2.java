package com.cz.baen;

public class Select2 {
    private Integer id;
    private String text;

    public Select2(){

    }
    public Select2(Integer id,String text){
        this.id=id;
        this.text=text;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
}
