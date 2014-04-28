
public class Entity {
 
 public int globalX;
 public int globalY;
 
 public Entity(int x, int y){
   this.globalX=x;
   this.globalY=y;
 }
 
 public void move(PVector pv){
   globalX += pv.x;
   globalY += pv.y; 
 }
}
