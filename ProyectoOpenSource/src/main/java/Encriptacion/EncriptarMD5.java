package Encriptacion;

import java.math.BigInteger;
import java.security.MessageDigest;

/**
 *
 * @author usuario
 */
public class EncriptarMD5 {

    public String getMD5(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] encByte = md.digest(input.getBytes());
            BigInteger numero = new BigInteger(1, encByte);
            String encriptacion = numero.toString(16);
            while (encriptacion.length() < 32) {
                encriptacion = "0" + encriptacion;
            }
            return encriptacion;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
