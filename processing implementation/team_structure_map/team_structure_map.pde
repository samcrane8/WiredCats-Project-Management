import java.util.LinkedList;

public static final int SCREENW = 1000;
public static final int SCREENH = 700;

LinkedList<Teammate> team;
LinkedList<Position> positions;
LinkedList<Entity> entities;

public boolean isTeammateCentric = true;

void setup(){
  size(SCREENW, SCREENH);
  team = new LinkedList<Teammate>();
  positions = new LinkedList<Position>();
  entities = new LinkedList<Entity>();
  positions.add(new Position("Engineer"));
  positions.add(new Position("Engineer"));
  positions.add(new Position("Engineer"));
  positions.add(new Position("Lead Engineer"));
  positions.add(new Position("General Robot Manager"));
  positions.add(new Position("Lead Field Manager"));
  positions.get(3).addNewInferiorPosition(positions.get(0));
  positions.get(3).addNewInferiorPosition(positions.get(1));
  positions.get(3).addNewInferiorPosition(positions.get(2));
  positions.get(4).addNewInferiorPosition(positions.get(5));
  positions.get(4).addNewInferiorPosition(positions.get(3));
  for (Position p : positions){
     p.setEntity(new Entity((int)random(SCREENW-100)+50, (int)random(SCREENH-100)+50));
     entities.add(p.getEntity());
  }
  
  draw_positions();
}


void loop(){
  background(255);
  draw_positions();
}

void adjustPositions(){
   for (Entity beingMoved : entities){
      for (Entity p2 : entities){
        if (beingMoved == p2) continue;
          PVector repulse = repulsionValue(beingMoved, p2);
          beingMoved.move(repulse);
      } 
   }
}

PVector repulsionValue(Entity appliedTo, Entity appliedBy){
  double x = appliedBy.globalX - appliedTo.globalX;
  x = 1/(x*x);
  double y = appliedBy.globalY - appliedTo.globalY;
  y = 1/(y*y);
  return new PVector((int)x, (int)y);
}

double distanceBetweenEntities(Entity e1, Entity e2){
  return sqrt( pow(e1.globalX - e2.globalX, 2) + pow(e1.globalY - e2.globalY, 2));
}

void draw_positions(){
  for (Position p : positions){
     LinkedList<Position> inferiors = p.getInferiors();
     Entity entity = p.getEntity();
     for (Position i : inferiors){
         Entity inf_ent = i.getEntity();
         line(entity.globalX, entity.globalY, inf_ent.globalX, inf_ent.globalY);
     }
  }
  for (Position p : positions){
     p.m_draw(p.getEntity().globalX, p.getEntity().globalY);
  }
}





