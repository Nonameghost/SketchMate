class Box  {
 
//Instead of any of the usual variables, we will store a reference to a Box2D body.
  Body body;
  float w;
  float h;
  Box() {
      w = 16;
      h = 16;
   
//  Build body.
      BodyDef bd = new BodyDef();
      bd.type = BodyType.DYNAMIC;
      bd.position.set(box2d.coordPixelsToWorld(mouseX,mouseY));
      body = box2d.createBody(bd);
   
//  Build shape.
      PolygonShape ps = new PolygonShape();
//  Box2D considers the width and height of a rectangle to be the distance from the center to the edge (so half of what we normally think of as width or height).
      float box2dW = box2d.scalarPixelsToWorld(w/2);
      float box2dH = box2d.scalarPixelsToWorld(h/2);
      ps.setAsBox(box2dW, box2dH);
   
      FixtureDef fd = new FixtureDef();
      fd.shape = ps;
      fd.density = 1;
//  Set physics parameters.
      fd.friction = 0.0 ;
      fd.restitution = 0.7;
      
//  Attach the Shape to the Body with the Fixture.
      body.createFixture(fd);
  }
  
   void display() {
//We need the Body’s location and angle.
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
 
    pushMatrix();
//Using the Vec2 position and float angle to translate and rotate the rectangle
    translate(pos.x,pos.y);
    rotate(-a);
    fill(175);
    stroke(255);
    strokeWeight(1);
    rectMode(CENTER);
    rect(0,0,w,h);
    popMatrix();
  }
  
  void killBody() {
    box2d.destroyBody(body);
  }
  
}
