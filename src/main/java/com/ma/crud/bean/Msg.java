package com.ma.crud.bean;

import java.util.HashMap;
import java.util.Map;

/**
 *  设计一个通用的返回类，将这次的请求的动作返回给客户端。
 */
public class Msg {
    private int code;

    private String message;
    // 用户要返回给前端的数据
    private Map<String, Object> extend = new HashMap<String, Object>();

    public static Msg success() {
        Msg msg = new Msg();
        msg.setCode(100);
        msg.setMessage("处理成功");
        return msg;
    }

    public static Msg failed() {
        Msg msg = new Msg();
        msg.setCode(200);
        msg.setMessage("处理失败");
        return msg;
    }
    // 定义一个扩展的方法，将其余的对象返回给客户端
     public Msg add(String key, Object value) {
        this.getExtend().put(key, value);
        return this;
     }


    public int getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}
