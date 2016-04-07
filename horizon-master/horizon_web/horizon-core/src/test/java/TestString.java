import org.junit.Test;

import java.io.*;

/**
 * Created by huangshiqian on 15/12/10.
 */
public class TestString {
  @Test
  public void test() throws IOException {
    File file = new File("/Users/huangshiqian/Downloads/oracle.txt");

    BufferedReader br = new BufferedReader(new FileReader(file));

    String s = null;

    while((s = br.readLine()) != null) {
      System.out.println(s);
    }
  }
}
