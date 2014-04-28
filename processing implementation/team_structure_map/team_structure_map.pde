import java.util.LinkedList;

public static final int SCREENW = 800;
public static final int SCREENH = 600;

LinkedList<Teammate> team;
LinkedList<Position> positions;

public boolean isTeammateCentric = true;

void setup(){
  size(SCREENW, SCREENH);
  team = new LinkedList<Teammate>();
  positions = new LinkedList<Position>();
}


void loop(){
  for (Teammate teammate : team){
     teammate.m_draw((int)random(SCREENW-40)+20, (int)random(SCREENH-40)+20);
  }
}



