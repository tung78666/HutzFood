/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Date;

/**
 *
 * @author asus
 */
public class User {

    private int id;
    private String name;
    private String email;
    private String password;
    private Role role;
    private UserStatus userStatus;
    private double point;
    private Date DOB;
    private String Phone;
    private String Location1;
    private String Location2;

    public User() {
    }

    public User(String name) {
        this.name = name;
    }

    public User(int id, String name, String email, String password, Role role, UserStatus userStatus, double point, Date DOB, String Phone, String Location1, String Location2) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.role = role;
        this.userStatus = userStatus;
        this.point = point;
        this.DOB = DOB;
        this.Phone = Phone;
        this.Location1 = Location1;
        this.Location2 = Location2;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Role getRole() {
        return role;
    }

    public int getRoleId() {
        return role.getId();
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public UserStatus getUserStatus() {
        return userStatus;
    }
    public int getUserStatusId() {
        return userStatus.getId();
    }
    public void setUserStatus(UserStatus userStatus) {
        this.userStatus = userStatus;
    }

    public double getPoint() {
        return point;
    }

    public void setPoint(double point) {
        this.point = point;
    }

    public Date getDOB() {
        return DOB;
    }

    public void setDOB(Date DOB) {
        this.DOB = DOB;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getLocation1() {
        return Location1;
    }

    public void setLocation1(String Location1) {
        this.Location1 = Location1;
    }

    public String getLocation2() {
        return Location2;
    }

    public void setLocation2(String Location2) {
        this.Location2 = Location2;
    }

}
