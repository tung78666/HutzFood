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

    public static String GOOGLE_CLIENT_ID = "";

    public static String GOOGLE_CLIENT_SECRET = "";

    public static String GOOGLE_REDIRECT_URI1 = "http://localhost:8080/FoodOrder/LoginGoogle";
    public static String GOOGLE_REDIRECT_URI2 = "http://localhost:8080/FoodOrder/RegGoogle";

    public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";

    public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
    
    public static String GOOGLE_LINK_GET_USER_EMAIL = "https://www.googleapis.com/auth/userinfo.email";

    public static String GOOGLE_GRANT_TYPE = "authorization_code";
}
