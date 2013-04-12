//The line that appears while dragging the mouse.
class TempLine{
  ArrayList<Vec2> vertices;
  
  TempLine(){
    vertices = new ArrayList<Vec2>();
  }
  
  void display(int[] strokeInfo){
    stroke(strokeInfo[0],strokeInfo[1],strokeInfo[2],strokeInfo[3]);
    strokeWeight(strokeInfo[4]);
    if (vertices.size() > 1){
      for(int i=1; i<vertices.size(); i++){
        line(vertices.get(i-1).x,vertices.get(i-1).y,vertices.get(i).x,vertices.get(i).y);
      }  
    }
  }
  
  void reset(){
    vertices = new ArrayList<Vec2>();
  }
}
