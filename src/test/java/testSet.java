import java.util.HashSet;
import java.util.Set;

public class testSet {
    public static void main(String[] args) {
        Set<String> hscode = new HashSet<>();
        hscode.add("1");
        hscode.add("2");
        hscode.add("3");
        Set<String> hscode2 = new HashSet<>();
        hscode2.add("1");
        hscode2.add("2");
        hscode2.add("3");
        Set<String> hscode3 = new HashSet<>();
        hscode3.addAll(hscode);
        hscode.addAll(hscode2);
        for (String s : hscode3) {
            System.out.println("s==" + s);
        }
    }
}
