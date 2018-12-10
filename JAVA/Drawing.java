
import javax.swing.*;


public class Drawing extends JPanel implements ActionListener{
  Timer time = new Timer(5,this);
  double x = 0, y = 0, velX = 2, velY = 2;

  public void paintComponent(Graphics g)
  {
    super.paintComponent(g);
    Graphics2D g2 = (Graphics2D) g;
    Ellipse2D circle = new Ellipse2D.Double(x,y,40,40);
    g2.fill(circle);
    t.start();
  }

  public void actionPerformed(ActionEvent e)
  {
    x += velX;
    y += velY;
    repaint();
  }
}
