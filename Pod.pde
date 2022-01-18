class Pod{
  PShape pod;
  int people = 0;
  int active = 0;
  float xLowBoundary;
  float yLowBoundary;
  float xUpBoundary;
  float yUpBoundary;
  float xScale;
  float yScale;
  float temp;
  float delta;
  float rate = 1;
  int time = 0;
  int time2 = 0;
  int choice;
  ArrayList<Zone> zones = new ArrayList<Zone>();
  
  Pod(PShape p){
    pod = p;
    temp = 16.3;
    delta = 0;
    choice = (int)random(0,2);
  }
  
  void pSketch(){
    stroke(255);
    strokeWeight(1.5);
    pod.disableStyle();
    //the fill color of each pod is based on its temperature - gradient from blue (cold) to red (hot)
    if (temp >= 14 && temp <= 15.5){
      float c = map(temp, 14, 15.5, 47, 0);
      fill(c, 0, 255);
    }if (temp > 15.5 && temp <= 17.5){
      float c = map(temp, 15.5, 17.5, 0,255);
      fill(0, c, 255);
    }if (temp > 17.5 && temp < 19){
      float c = map(temp, 17.5, 19, 244,0);
      fill(0, 255, c);
    }if (temp >=19 && temp < 20.5){
      float c = map(temp, 19, 20.5, 0,255);
      fill(c, 255, 0);
    }
    if (temp >=20.5 && temp < 24){
      float c = map(temp, 20.5, 24, 255,0);
      fill(255, c, 0);
    }
    if (temp >=24 && temp < 25){
      float c = map(temp, 24, 25, 255,148);
      fill(c, 0, 0);
    }  
    shape(pod, xLowBoundary, yLowBoundary, xScale, yScale);
  }
}
