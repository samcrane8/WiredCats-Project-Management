
public class Position implements VisualEntity{
  
 private String full_title;
 private LinkedList<Position> inferiors;


 public Position(String full_title, LinkedList<Position> inferiors){
   this.full_title = full_title;
   inferiors = new LinkedList<Position>();
 } 

 public Position(String full_title){
   this(full_title, new LinkedList<Position>());
 }
 
 
 public void m_draw(int x, int y){
   
 }
 
 public void addNewInferiorPosition( Position p){
   inferiors.add(p);
 }
}
