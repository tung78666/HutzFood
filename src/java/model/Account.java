/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author Dan09
 */
public class Account {

    /*AdID char(50) NOT NULL PRIMARY KEY CHECK (AdID like 'FU[0-9][0-9][0-9][0-9][0-9][0-9]'), 
AdName nvarchar(100) NOT NULL,
AdEmail char(100),
[Shift] date NOT NULL,
AdPassword char(50) NOT NULL*/
    private String ID;
    private String Name;
    private String Email;
    private Date dateStart;
    private String Password;
    private boolean Role;

    public Account() {
    }

    public Account(String ID, String Name, String Email, Date dateStart, String Password, boolean Role) {
        this.ID = ID;
        this.Name = Name;
        this.Email = Email;
        this.dateStart = dateStart;
        this.Password = Password;
        this.Role = Role;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public Date getDateStart() {
        return dateStart;
    }

    public void setDateStart(Date dateStart) {
        this.dateStart = dateStart;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public boolean isRole() {
        return Role;
    }

    public void setRole(boolean Role) {
        this.Role = Role;
    }

    
}
