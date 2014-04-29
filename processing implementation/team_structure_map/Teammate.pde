
public class Teammate {
 
 public static final int HEIGHT = 50;
  
 private LinkedList<Position> positions;
 private String name;
 
 
 public Teammate(String name){
  this.name = name;
 }
 
 public String getName(){
   return name;
 }
 
 public boolean isTouching(int x, int y){
   if (x > x + 4*name.length() ||
       x < x - 4*name.length() ||
       y > y + 4*name.length() ||
       y < y - 4*name.length() ){
           return false;
       }
       return true;
 }
 
 public void m_draw(int x, int y){
   color(200,200,200);
   fill(255);
   ellipse(x,y,8*name.length(),HEIGHT);
   fill(50);
   text(name,x-3*name.length(),y+(.1*HEIGHT));
 }
  
}
