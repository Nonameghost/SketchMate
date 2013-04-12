class GameObject{
  int id; //Not entirely sure why, could be useful.
  String group; //Static,Dynamic,Sensor(Mechanic),Passive(Non-Phys,Decorative)
  String type; //Type of game object. Primitive types include line, square, elipse. Also needs to define if object
                 // requires a phyisics body. FIGURE THIS OUT BEFORE MOVING ON.
                 
  GameObject(){
//    print("This is a base class and should not be instaniated. Please instantiate a child class instead.");
  }
  
  void display(){ 
  }
}
  
