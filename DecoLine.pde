class DecoLine extends GameObject{
  ArrayList<Vec2> vertices;
  
  int strokeWeight;
  int strokeRed;
  int strokeGreen;
  int strokeBlue;
  int strokeAlpha;
  //  int strokeCap;
  //  int strokeJoin;
 
  DecoLine(ArrayList<Vec2> vInfo,int[] strokeInfo){
    
    strokeRed = strokeInfo[0];
    strokeGreen = strokeInfo[1];
    strokeBlue = strokeInfo[2];
    strokeAlpha = strokeInfo[3];
    strokeWeight = strokeInfo[4];
    
    vertices = new ArrayList<Vec2>();
    vertices = vInfo;
  }
   void display() {
    strokeWeight(strokeWeight);
    stroke(strokeRed,strokeGreen,strokeBlue,strokeAlpha);
    noFill();
    //Draw the ChainShape as a series of vertices.
    beginShape();
    for (Vec2 v: vertices) {
      vertex(v.x,v.y);
    }
    endShape();
  }
}
