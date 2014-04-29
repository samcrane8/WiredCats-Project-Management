import java.util.*;


public static final int SCREENW = 1000;
public static final int SCREENH = 700;

LinkedList<Teammate> team;
LinkedList<Position> positions;
LinkedList<Entity> entities;

public boolean isTeammateCentric = true;

void setup() {
  size(SCREENW, SCREENH);
  
  

  team = new LinkedList<Teammate>();
  positions = new LinkedList<Position>();
  entities = new LinkedList<Entity>();
  positions.add(new Position("Engineer"));
  positions.get(0).setPositionHolder(new Teammate("KDai"));
  positions.add(new Position("Engineer"));
  positions.get(1).setPositionHolder(new Teammate("KDai"));
  positions.add(new Position("Engineer"));
  positions.get(2).setPositionHolder(new Teammate("KDai"));
  positions.add(new Position("Lead Engineer"));
  positions.get(3).setPositionHolder(new Teammate("KDai"));
  positions.add(new Position("General Robot Manager"));
  positions.get(4).setPositionHolder(new Teammate("KDai"));
  positions.add(new Position("Lead Field Manager"));
  positions.add(new Position("Lead Field Manager"));
  positions.add(new Position("Lead Field Manager"));
  positions.add(new Position("Lead Field Manager"));
  positions.add(new Position("Lead Field Manager"));
  positions.get(5).setPositionHolder(new Teammate("KDai"));
  
  positions.get(3).addNewInferiorPosition(positions.get(0));
  positions.get(3).addNewInferiorPosition(positions.get(1));
  positions.get(3).addNewInferiorPosition(positions.get(2));
  positions.get(4).addNewInferiorPosition(positions.get(5));
  positions.get(4).addNewInferiorPosition(positions.get(3));
  for (Position p : positions) {
    p.setEntity(new Entity(SCREENW/2+ (int)random(20), SCREENH/2+(int)random(20)));
    entities.add(p.getEntity());
  }
}

void mousePressed(){
   
}

void mouseDragged(){
  for (Position p : positions) {
    if (p.isTouching(mouseX, mouseY)) {
      p.getEntity().setPos(mouseX, mouseY);
    }
  }
}


void draw() {
  background(255);
  adjustPositions();
  draw_positions();

  getInteractions();
}

void getInteractions() {
  for (Position p : positions) {
    if (p.isTouching(mouseX, mouseY)) {
      p.infoPopup(mouseX, mouseY);
    }
  }
  for (Position moved : positions) {
    for (Position b : positions){
       if (moved==b) continue;
       if (moved.getEntity().globalX == b.getEntity().globalX &&
           moved.getEntity().globalY == b.getEntity().globalY) 
              moved.getEntity().move(new PVector(5,5));
       if (moved.isInferior(b) || b.isInferior(moved) && distanceBetweenEntities(moved.getEntity(),b.getEntity()) > 500)
           moved.getEntity().move(repulsionValue(b.getEntity(),moved.getEntity()));
       else moved.getEntity().move(repulsionValue(b.getEntity(),moved.getEntity()));
    }
    Entity yeah = moved.getEntity();
    if (yeah.globalX < 50 ) yeah.globalX = 50;
    if (yeah.globalX > SCREENW-50) yeah.globalX = SCREENW -50;
    if (yeah.globalY < 50 ) yeah.globalY = 50;
    if (yeah.globalY > SCREENH-50) yeah.globalY = SCREENH-50;
  }
}

void adjustPositions() {
  for (Entity beingMoved : entities) {
    for (Entity p2 : entities) {
    }
  }
}

boolean isColliding(Position p ) {
  for (Position d : positions) {
    if (p.isTouching(d) && p != d) {
      return true;
    }
  } 
  return false;
}

PVector repulsionValue(Entity appliedTo, Entity appliedBy) {
  double x = appliedBy.globalX - appliedTo.globalX;
  x *= .05;
  x = 1/(x);
  double y = appliedBy.globalY - appliedTo.globalY;
  y*= .05;
  y = 1/(y);
  return new PVector((int)x, (int)y);
}


double distanceBetweenEntities(Entity e1, Entity e2) {
  return sqrt( pow(e1.globalX - e2.globalX, 2) + pow(e1.globalY - e2.globalY, 2));
}

PVector vectorBetweenEntities(Entity e1, Entity e2){
  return new PVector (e1.globalX-e2.globalX,e1.globalY-e2.globalY);
}

void draw_positions() {
  for (Position p : positions) {
    LinkedList<Position> inferiors = p.getInferiors();
    Entity entity = p.getEntity();
    for (Position i : inferiors) {
      Entity inf_ent = i.getEntity();
      fill(i.getColor());
      line(entity.globalX, entity.globalY, inf_ent.globalX, inf_ent.globalY);
    }
  }
  for (Position p : positions) {
    p.m_draw(p.getEntity().globalX, p.getEntity().globalY);
  }
}



