class Level{
  
  String author;
  String description;
  String name;
  
  String gameMode; // Change to GAMEMODE object if nescessary, or search against global gamemode array.
  
  ArrayList<GameObject> listGameObj;
  //  ArrayList<GameObject> listStaticObj; If Nescessary to list each type explicitally. (Updates perhaps?)
  //  ArrayList<GameObject> listDynamicObj;
  //  ArrayList<GameObject> listDecoObj;
  //  ArrayList<GameObject> listMechObj;
  
  PImage thumbnail;
  
  Level(String argName,String argAuthor,String argGameMode){
    name = argName;
    author = argAuthor;
    gameMode = argGameMode;
    
    listGameObj = new ArrayList<GameObject>();
  }
  
}
