//Main class. Starts game, declares helpers,paths,assets. Tries to start game, catches
//error if something is wrong. Generally the entry point.
//------------------------------------------------------------------------------------
//Author: Neil Sveri
//Name: SketchMates.pde
//Description:Main function. Starts game, declares helpers,paths,assets. Tries to start game, catches
//error if something is wrong. Generally the entry point.
//------------------------------------------------------------------------------------
import pbox2d.*;
import controlP5.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.*;


PBox2D box2d;
Editor editor;

//color  picker
ControlP5 cp5;
ColorPicker uiColorPicker;
Slider uiWeightSlider;

String state;

//Initial Setup, gets overwritten by the other state functions.
void setup(){
  print("Setup...");
  size(800,600);
  background(255);
  smooth(4);
  box2d = new PBox2D(this);
  editor = new Editor();
  state = "editor";
  
  cp5 = new ControlP5(this);
  uiColorPicker = cp5.addColorPicker("picker").setPosition(width*.65, height*.05).setColorValue(color(0,0,0,255));
  uiWeightSlider = cp5.addSlider("weight").setPosition(width*.65, height*.015).setSize(uiColorPicker.getWidth(),20).setRange(1,100);
  cp5.getController("weight").getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER).setPaddingX(0);
}

void draw(){
  if (state == "editor"){
    editor.draw();
  }
}

void mousePressed(){
  if (state == "editor"){
    editor.mousePressed();
  }
}
void mouseDragged(){
  if (state == "editor"){
    editor.mouseDragged();
  }
}
void mouseReleased(){
  if (state == "editor"){
    editor.mouseReleased();
  }
}
void keyPressed(){
  if (state == "editor"){
    editor.keyPressed(key);
  }
}

public void controlEvent(ControlEvent c) {
  // when a value change from a ColorPicker is received, extract the ARGB values
  // from the controller's array value
  if(c.isFrom(uiColorPicker)) {
    editor.updateColor(c);
  }
}

void weight(int theWeight) {
  editor.activeStrokeInfo[4] = theWeight;
}
