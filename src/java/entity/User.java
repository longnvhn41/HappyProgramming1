/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Nguyen Van Long
 */
public class User {

    int id;
    String name;
    String account;
    String password;
    String email;
    String phone;
    String dob;
    int gender;
    String address;
    int role;
    String ava;
    String framework;

    public String getFramework() {
        return framework;
    }

    public void setFramework(String framework) {
        this.framework = framework;
    }

    public User(int id, String name, String account, String password, String email, String phone, String dob, int gender, String address, int role, String ava, String framework) {
        this.id = id;
        this.name = name;
        this.account = account;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.dob = dob;
        this.gender = gender;
        this.address = address;
        this.role = role;
        this.ava = ava;
        this.framework = framework;
    }
    
    public User() {
    }

    public User(int id, String name, String account, String password, String email, String phone, String dob, int gender, String address, int role, String ava) {
        this.id = id;
        this.name = name;
        this.account = account;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.dob = dob;
        this.gender = gender;
        this.address = address;
        this.role = role;
        this.ava = ava;
    }
    
    public User(int id, String name, String account, String password, String email,
            String phone, String dob, int gender, String address, int role) {
        this.id = id;
        this.name = name;
        this.account = account;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.dob = dob;
        this.gender = gender;
        this.address = address;
        this.role = role;
    }public User(int id, String name, String account, String password, String email,
            String phone, String dob, int gender, String address) {
        this.id = id;
        this.name = name;
        this.account = account;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.dob = dob;
        this.gender = gender;
        this.address = address;
        
    }
    public User(String name, String account, String password, String email, String phone, 
            String dob, int gender, String address, int role) {
       
        this.name = name;
        this.account = account;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.dob = dob;
        this.gender = gender;
        this.address = address;
        this.role = role;
    }
    public User(int id,String account, String password, int role, String ava) {
       
        
        this.account = account;
        this.password = password;
        this.role = role;
        this.ava=ava;
    }
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

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getAva() {
        return ava;
    }

    public void setAva(String ava) {
        this.ava = ava;
    }
    
}
