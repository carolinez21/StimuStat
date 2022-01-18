class Grid{
  float x1;
  float y1;
  float x2;
  float y2;
  
  Grid(float xcoord1, float ycoord1, float xcoord2, float ycoord2){
    x1 = xcoord1;
    y1 = ycoord1;
    x2 = xcoord2;
    y2 = ycoord2;
  }
  
  void gSketch(){
    stroke(255);
    strokeWeight(0.1);
    line(x1, y1, x2, y2);
  }
}
