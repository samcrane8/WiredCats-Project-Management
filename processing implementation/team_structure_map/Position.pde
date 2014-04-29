
public class Position {
  
 
 public static final int HEIGHT = 50; 
 public static final color LIGHT_GREEN = #4FE858;
 public static final color MED_GREEN = #46BD6E;
 public static final color OTHER_GREEN = #30C93A;
  
 private String full_title;
 private LinkedList<Position> inferiors;
 private Teammate positionHolder;
 private Entity entity;
 private color c;

 public Position(String full_title, LinkedList<Position> inferiors){
   this.full_title = full_title;
   inferiors = inferiors;
   c = LIGHT_GREEN;
 } 

 public Position(String full_title){
   this.full_title = full_title;
   inferiors = new LinkedList<Position>();
   c = LIGHT_GREEN;
 }
 
 public void setPositionHolder(Teammate t){
   positionHolder = t;
 }
 
 public color getColor(){
   return c;
 }
 
 public void setEntity(Entity e){
   this.entity = e; 
 }
 
  public void m_draw(int x, int y){
   stroke(c);
   fill(c);
   ellipse(x,y,8*full_title.length(),HEIGHT);
   fill(50);
   text(full_title,x-3*full_title.length(),y+(.1*HEIGHT));
 }
 
 public boolean isInferior(Position p){
   return inferiors.contains(p); 
 }
 
 public void infoPopup(int x1, int y1){
   int x = x1;
   int y = y1;
   fill(255,255,255);
   pushMatrix();
   translate(x+20,y+20);
   rect(0,0,200,200);
   fill(0,0,0);
   text(full_title,20,20);
   String name = "";
   if (positionHolder != null) name = positionHolder.getName();
   text("Position Holder: "+name,20, 40);
   popMatrix();
    
 }
 
 public boolean isTouching(Position p){
   if (p.getEntity()==null) return false;
   return isTouching(p.getEntity().globalX, p.getEntity().globalY); 
 }
 
 public boolean isTouching(int x, int y){
   if (x > entity.globalX + 4*full_title.length() ||
       x < entity.globalX - 4*full_title.length() ||
       y > entity.globalY + HEIGHT ||
       y < entity.globalY - HEIGHT ){
           return false;
       }
       return true;
 }
 
 
 public void addNewInferiorPosition( Position p){
   inferiors.add(p);
 }
 
 public LinkedList<Position> getInferiors(){
   return inferiors;
 }
 
 public Entity getEntity(){
   return entity;
 }
}
