class StaticLine extends GameObject{
  ArrayList<Vec2> vertices;
  Vec2[] chainVerts;
  Body body;
  
  int strokeWeight;
  int strokeRed;
  int strokeGreen;
  int strokeBlue;
  int strokeAlpha;
 
  StaticLine(ArrayList<Vec2> arg, int[] strokeInfo) {
    
    strokeRed = strokeInfo[0];
    strokeGreen = strokeInfo[1];
    strokeBlue = strokeInfo[2];
    strokeAlpha = strokeInfo[3];
    strokeWeight = strokeInfo[4];
 
    vertices = new ArrayList<Vec2>();
    vertices = arg;
    ChainShape chain = new ChainShape();
 
    //Make an array of Vec2 for the ChainShape.
    chainVerts = new Vec2[vertices.size()];
 
 
    for (int i = 0; i < chainVerts.length; i++) {
    //Convert each vertex to Box2D World coordinates.
      chainVerts[i] = box2d.coordPixelsToWorld(vertices.get(i));
    }
 
    //Create the ChainShape with array of Vec2.
    chain.createChain(chainVerts, chainVerts.length);
 
    //Attach the Shape to the Body.
    BodyDef bd = new BodyDef();
    body = box2d.world.createBody(bd);
    body.createFixture(chain, 1);
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
  
   void killBody() {
    box2d.destroyBody(body);
  }
}
