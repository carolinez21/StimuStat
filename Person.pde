class Person{
  float radius = 5;
  float diameter = 10;
  float xloc;
  float yloc;
  boolean draw = false;
  Zone zone;
  Pod pod;
  boolean inPod = false;
  float time = 0;
  boolean active = false;

  Person(){
  }
  
  void sketch(){
    strokeWeight(1);
    fill(255);
    circle(xloc, yloc, diameter);
  }
  
  void redraw(){
    strokeWeight(1);
    fill(255);
    stroke(255);
    circle(xloc, yloc, diameter);
  }
}
