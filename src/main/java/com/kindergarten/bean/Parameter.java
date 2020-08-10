package com.kindergarten.bean;

public class Parameter {
    private int parameterId; //参数id
    private String parameterName;//参数类型名（中文）
    private String parameterText;//参数名字，例如禁用 启用
    private String parameterType;//参数类型名（字符）
    private int parameterValue;//参数名字对应的id 例如禁用对应为1 启用对应为2

    public Parameter() {
    }

    public int getParameterId() {
        return parameterId;
    }

    public void setParameterId(int parameterId) {
        this.parameterId = parameterId;
    }

    public String getParameterName() {
        return parameterName;
    }

    public void setParameterName(String parameterName) {
        this.parameterName = parameterName;
    }

    public String getParameterText() {
        return parameterText;
    }

    public void setParameterText(String parameterText) {
        this.parameterText = parameterText;
    }

    public String getParameterType() {
        return parameterType;
    }

    public void setParameterType(String parameterType) {
        this.parameterType = parameterType;
    }

    public int getParameterValue() {
        return parameterValue;
    }

    public void setParameterValue(int parameterValue) {
        this.parameterValue = parameterValue;
    }
}
