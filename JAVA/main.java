import javax.swing.*;

public class main
{
  public static void main(String args)
  {
    Drawing d = new Drawing();
    JFrame frame = new JFrame();
    frame.add(d);
    frame.setVisible(true);
    frame.setSize(900,800);
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    frame.setTitle("Test 1.1");
  }
}
