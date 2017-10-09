package com.cz.bean;


public class ControllerResult {
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";

    private String result;
    private String message;

    public ControllerResult(String result, String message) {
        this.result = result;
        this.message = message;

    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public static ControllerResult getSUCCESSResult(String message) {
        return new ControllerResult(SUCCESS, message);
    }

    public static ControllerResult getFAILResult(String message) {
        return new ControllerResult(FAIL, message);
    }
}
