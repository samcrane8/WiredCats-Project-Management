
public class Entity {
 
 public int globalX;
 public int globalY;
 
 public Entity(int x, int y){
   this.globalX=x;
   this.globalY=y;
 }
 
 public void setPos(int x, int y){
  this.globalX = x;
  this.globalY = y; 
 }
 
 public void move(PVector pv){
   if ( globalX <= 50 && pv.x < 0) return;
   if ( globalX >= SCREENW - 50 && pv.x > 0) return;
   if ( globalY <= 50 && pv.y < 0) return;
   if ( globalY >= SCREENH - 50 && pv.y > 0) return; 
   globalX += pv.x;
   globalY += pv.y; 
 }
}
