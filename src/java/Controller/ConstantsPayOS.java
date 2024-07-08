/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import com.lib.payos.PayOS;

/**
 *
 * @author Dan09
 */
public class ConstantsPayOS {
	private static final String CLIENT_ID = "eba01108-59ae-4971-90f1-c5d95f572085";
    private static final String API_KEY = "46218893-d36a-40f0-9150-d7d077db8af7";
    private static final String CHECKSUM_KEY = "090bdd8cb8e1860777b9a0da9890766f8c3fa08f65164d15fb1a3784f3ec71c6";
    
    private static final PayOS payOSInstance;

    static {
        payOSInstance = new PayOS(CLIENT_ID, API_KEY, CHECKSUM_KEY);
    }

    public static PayOS getPayOS() {
        return payOSInstance;
    }
}
