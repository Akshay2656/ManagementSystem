package util;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

public class PasswordUtil {
    private static final Random random = new Random();
    private static final String SALT = "java";

    public static String hash(String password) throws NoSuchAlgorithmException {
        MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
        byte[] hash = messageDigest.digest((SALT + password).getBytes(StandardCharsets.UTF_8));

        StringBuilder builder = new StringBuilder();
        for(byte b : hash){
            builder.append(String.format("%02x", b));
        }
        return builder.toString();
    }

    private static final String LETTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    public static String generatePassword() {
        StringBuilder password = new StringBuilder();
        for(int i = 0; i < 10; i++){
            password.append(LETTERS.charAt(random.nextInt(LETTERS.length())));
        }
        return password.toString();
    }
}
