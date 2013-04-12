

class Editor{
  int[] activeStrokeInfo;
  int activeStrokeRed;
  int activeStrokeGreen;
  int activeStrokeBlue;
  int activeStrokeAlpha;
  
  //mouse variables
  boolean mouseWasDragged;
  
  //TempObjects
  ArrayList<Vec2> activeVertices;
  TempLine tempLine;
  
  Level activeLevel;
  
  String activeTool;
  
  ArrayList<Box> testBoxArray;
  
  Editor(){
    print("\nINSTRUCTIONS:\nPRESS 1 for Solid Lines\nPRESS 2 for Decorative Lines\nPRESS 3 for boxes\n\nControlled with mouse. Click and drag to draw(1,2),click to drop boxes(3).");
    
    box2d.createWorld();
    
    mouseWasDragged = false;
    
    activeVertices = new ArrayList<Vec2>();
    tempLine = new TempLine();
    
    activeStrokeInfo = new int[5];
    activeStrokeInfo[0] = 0;//red
    activeStrokeInfo[1] = 0;//green
    activeStrokeInfo[2] = 0;//blue
    activeStrokeInfo[3] = 255;//alpha
    activeStrokeInfo[4] = 1;//strokeWeight
    
    stroke(activeStrokeInfo[0],activeStrokeInfo[1],activeStrokeInfo[2],activeStrokeInfo[3]);
    strokeWeight(activeStrokeInfo[4]);
    strokeCap(ROUND);
    strokeJoin(ROUND);
    
    activeLevel = new Level("test","test","test");
    activeTool = "StaticLine";
    
    testBoxArray = new ArrayList<Box>();
  }

  void draw(){

    background(255);
    box2d.step();
    
    for (GameObject go: activeLevel.listGameObj){
      go.display();
    }
    for (Box b: testBoxArray){
      b.display();
    }
    
    tempLine.display(activeStrokeInfo);
  }

  void mousePressed(){
    if (activeTool == "StaticLine" || activeTool == "DecoLine"){
      activeVertices.add(new Vec2(mouseX,mouseY));
    }
  }

  void mouseDragged(){
    if (activeTool == "StaticLine" || activeTool == "DecoLine"){
      if (!mouseWasDragged){
        mouseWasDragged = true;
      }
      //    line(mouseX, mouseY, pmouseX, pmouseY);
      activeVertices.add(new Vec2(mouseX,mouseY));
      tempLine.vertices.add(new Vec2(mouseX,mouseY));
    }
  }
  
  void mouseReleased(){
    if (mouseWasDragged){
      if (activeTool == "StaticLine"){
        activeLevel.listGameObj.add(new StaticLine(activeVertices,activeStrokeInfo));
        activeVertices = new ArrayList<Vec2>();
        mouseWasDragged = false;
        tempLine.reset();
      }
      else if (activeTool == "DecoLine"){
        activeLevel.listGameObj.add(new DecoLine(activeVertices,activeStrokeInfo));
        activeVertices = new ArrayList<Vec2>();
        mouseWasDragged = false;
        tempLine.reset();
      }
    }
    else if (activeTool == "TestBox"){
        testBoxArray.add(new Box());  
    }
  }
  
  void keyPressed(char k){
    if (k == '1'){
      activeTool = "StaticLine";
      print("StaticLine\n");
    }
    else if (k == '2'){
      activeTool = "DecoLine";
      print("DecoLine\n");
    }
    else if (k == '3'){
      activeTool = "TestBox";
     print("TestBox\n"); 
    }
  }
  
  void updateColor(ControlEvent c) {
    activeStrokeInfo[0] = int(c.getArrayValue(0));
    activeStrokeInfo[1] = int(c.getArrayValue(1));
    activeStrokeInfo[2] = int(c.getArrayValue(2));
    activeStrokeInfo[3] = int(c.getArrayValue(3));
  }
  
  
//End of Class// 
}
