class Zone{
  float xCorner;
  float yCorner;
  float dim;
  float temp;
  float delta;
  int time;
  int time2;
  int people = 0;
  int active = 0;
  int choice;
  ArrayList<Pod> pods = new ArrayList<Pod>();

  Zone(float x, float y, float size){
    xCorner = x;
    yCorner = y;
    dim = size;
    temp = 16.3;
    delta = 0;
    time = 0;
    time2 = 0;
    choice = (int) random(0,2);
  }
  
  void sketch(){
     noStroke();
     //the fill color of each zone is based on its temperature - gradient from blue (cold) to red (hot)
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
    rect(xCorner, yCorner, dim, dim);
  }
}
