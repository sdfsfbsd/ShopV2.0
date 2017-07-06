package domain;

import java.util.HashSet;
import java.util.Set;


/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User  implements java.io.Serializable {


    // Fields    

     private Integer idUser;
     private String username;
     private String password;
     private String add1;
     private String add2;
     private String add3;
     private String phone;
     private Integer balance;
     private String picUrl;
     private Set shops = new HashSet(0);
     private Set orders = new HashSet(0);


    // Constructors

    /** default constructor */
    public User() {
    }

	/** minimal constructor */
    public User(String username, String password, String add1, String phone, Integer balance, String picUrl) {
        this.username = username;
        this.password = password;
        this.add1 = add1;
        this.phone = phone;
        this.balance = balance;
        this.picUrl = picUrl;
    }
    
    /** full constructor */
    public User(String username, String password, String add1, String add2, String add3, String phone, Integer balance, String picUrl, Set shops, Set orders) {
        this.username = username;
        this.password = password;
        this.add1 = add1;
        this.add2 = add2;
        this.add3 = add3;
        this.phone = phone;
        this.balance = balance;
        this.picUrl = picUrl;
        this.shops = shops;
        this.orders = orders;
    }

   
    // Property accessors

    public Integer getIdUser() {
        return this.idUser;
    }
    
    public void setIdUser(Integer idUser) {
        this.idUser = idUser;
    }

    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }

    public String getAdd1() {
        return this.add1;
    }
    
    public void setAdd1(String add1) {
        this.add1 = add1;
    }

    public String getAdd2() {
        return this.add2;
    }
    
    public void setAdd2(String add2) {
        this.add2 = add2;
    }

    public String getAdd3() {
        return this.add3;
    }
    
    public void setAdd3(String add3) {
        this.add3 = add3;
    }

    public String getPhone() {
        return this.phone;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getBalance() {
        return this.balance;
    }
    
    public void setBalance(Integer balance) {
        this.balance = balance;
    }

    public String getPicUrl() {
        return this.picUrl;
    }
    
    public void setPicUrl(String picUrl) {
        this.picUrl = picUrl;
    }

    public Set getShops() {
        return this.shops;
    }
    
    public void setShops(Set shops) {
        this.shops = shops;
    }

    public Set getOrders() {
        return this.orders;
    }
    
    public void setOrders(Set orders) {
        this.orders = orders;
    }
   








}