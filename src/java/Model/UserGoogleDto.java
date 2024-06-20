/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Dan09
 */
public class UserGoogleDto {

    private String id;
    private String name;
    private String email;
    private String password;
    private boolean verified_email;

    public UserGoogleDto() {
    }

    public UserGoogleDto(String id, String name, String email, String password, boolean verified_email) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.verified_email = verified_email;
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

    public boolean isVerified_email() {
        return verified_email;
    }

    public void setVerified_email(boolean verified_email) {
        this.verified_email = verified_email;
    }

    @Override
    public String toString() {
        return "UserGoogleDto{" + "id=" + id + ", name=" + name + ", email=" + email + ", password=" + password + ", verified_email=" + verified_email + '}';
    }

    

}
