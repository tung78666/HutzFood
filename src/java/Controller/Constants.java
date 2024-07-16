/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

/**
 *
 * @author Dan09
 */
public class Constants {
//Base 64 : ID and secret Q2xpZW50IElECjI3ODA5NTgzNTg4Mi1wNDVnazJyMzRsYWxuOGl0a3Y2Y3NqMnJtN29hMHNzYy5hcHBzLmdvb2dsZXVzZXJjb250ZW50LmNvbQpfX18KQ2xpZW50IHNlY3JldApHT0NTUFgtRWN0TTdIOWRlT09ja3l4c0p5YWNtVzRTdEZETQ==
    public static String GOOGLE_CLIENT_ID = "";

    public static String GOOGLE_CLIENT_SECRET = "";

    public static String GOOGLE_REDIRECT_URI1 = "http://localhost:8080/HutzFood/LoginGoogle";
    public static String GOOGLE_REDIRECT_URI2 = "http://localhost:8080/HutzFood/RegGoogle";

    public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";

    public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
    
    public static String GOOGLE_LINK_GET_USER_EMAIL = "https://www.googleapis.com/auth/userinfo.email";

    public static String GOOGLE_GRANT_TYPE = "authorization_code";
}
