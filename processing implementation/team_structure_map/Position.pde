
public class Position{
  
 
 public static final int HEIGHT = 50; 
  
 private String full_title;
 private LinkedList<Position> inferiors;
 private Teammate positionHolder;
 private Entity entity;

 public Position(String full_title, LinkedList<Position> inferiors){
   this.full_title = full_title;
   inferiors = inferiors;
 } 

 public Position(String full_title){
   this.full_title = full_title;
   inferiors = new LinkedList<Position>();
 }
 
 public void setPositionHolder(Teammate t){
   positionHolder = t;
 }
 
 public void setEntity(Entity e){
   this.entity = e; 
 }
 
  public void m_draw(int x, int y){
   color(200,200,200);
   fill(255);
   ellipse(x,y,8*full_title.length(),HEIGHT);
   fill(50);
   text(full_title,x-3*full_title.length(),y+(.1*HEIGHT));
   
   for ( Position p : inferiors){
      
   }
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
