float buildingW;
float lowerZoneW;
float upperZoneW;
float vSpacing;
float hSpacing;
boolean clicked;
float rate = 1;
Zone zones[] = new Zone[9];
Grid gridLines[] = new Grid[68];
Pod pods[] = new Pod[12];
float incr = .0005;
boolean inPod = false;
PVector condensation[] = new PVector[1000];
PVector Ucondensation[] = new PVector[1000];
int numC = 0;
int tubes = 0;
ArrayList<Person> people = new ArrayList<Person>();
int Pnum = 0;
int central = 0;

Zone z1, z2, z3, z4, z5, z6, z7, z8, z9;
//first floor grid lines
Grid g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13, g14, g15, g16, g17, g18, g19, g20, g21, g22, g23, g24, g25, g26, g27, g28, g29, g30, g31, g32, g33, g34;
//second floor grid lines
Grid g35, g36, g37, g38, g39, g40, g41, g42, g43, g44, g45, g46, g47, g48, g49, g50, g51, g52, g53, g54, g55, g56, g57, g58, g59, g60, g61, g62, g63, g64, g65, g66, g67, g68;
PShape pod0, pod1, pod2, pod3, pod4, pod5, pod6, pod7, pod8, pod9, pod10, pod11;
Pod p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11;


void setup(){
  fullScreen();
  buildingW = 450;
  lowerZoneW = buildingW / 3;
  upperZoneW = buildingW / 2;
  vSpacing = (height - buildingW)/2;
  hSpacing = (width - 2*buildingW)/3;
 
  background(255); 
  
  for(int i = 1; i < 200;i++){
    Person person = new Person();
    people.add(person);
  }
  
  pod0 = loadShape("svg/pod 0.svg");
  pod1 = loadShape("svg/pod 1.svg");
  pod2 = loadShape("svg/pod 2.svg");
  pod3 = loadShape("svg/pod 3.svg");
  pod4 = loadShape("svg/pod 4.svg");
  pod5 = loadShape("svg/pod 5.svg");
  pod6 = loadShape("svg/pod 6.svg");
  pod7 = loadShape("svg/pod 7.svg");
  pod8 = loadShape("svg/pod 8.svg");
  pod9 = loadShape("svg/pod 9.svg");
  pod10 = loadShape("svg/pod 10.svg");
  pod11 = loadShape("svg/pod 11.svg");
  p0 = new Pod(pod0); p1 = new Pod(pod1); p2 = new Pod(pod2); p3 = new Pod(pod3); p4 = new Pod(pod4); p5 = new Pod(pod5); p6 = new Pod(pod6); p7 = new Pod(pod7); p8 = new Pod(pod8); p9 = new Pod(pod9);
  p10 = new Pod(pod10); p11 = new Pod(pod11);
  pods[0] = p0; pods[1] = p1; pods[2] = p2; pods[3] = p3; pods[4] = p4; pods[5] = p5; pods[6] = p6; pods[7] = p7; pods[8] = p8; pods[9] = p9; pods[10] = p10; pods[11] = p11;
  p0.xLowBoundary = hSpacing + 3*(lowerZoneW/6); p0.yLowBoundary = vSpacing + 2*(lowerZoneW/6);
  p1.xLowBoundary = hSpacing + 12*(lowerZoneW/6); p1.yLowBoundary = vSpacing + (lowerZoneW/6); p1.xUpBoundary = hSpacing + 17*(lowerZoneW/6); p1.yUpBoundary = vSpacing + 4*(lowerZoneW/6);
  p2.xLowBoundary = hSpacing + (lowerZoneW/6); p2.yLowBoundary = vSpacing + 10*(lowerZoneW/6); p2.xUpBoundary = hSpacing + 4*(lowerZoneW/6); p2.yUpBoundary = vSpacing + 13*(lowerZoneW/6);
  p3.xLowBoundary = hSpacing + 13*(lowerZoneW/6); p3.yLowBoundary = vSpacing + 7*(lowerZoneW/6); p3.xUpBoundary = hSpacing + 16*(lowerZoneW/6); p3.yUpBoundary = vSpacing + 10*(lowerZoneW/6);
  p4.xLowBoundary = hSpacing + 10*(lowerZoneW/6); p4.yLowBoundary = vSpacing + 14*(lowerZoneW/6); p4.xUpBoundary = hSpacing + 16*(lowerZoneW/6); p4.yUpBoundary = vSpacing + 16*(lowerZoneW/6);
  p5.xLowBoundary = hSpacing + 6*(lowerZoneW/6); p5.yLowBoundary = vSpacing + 6*(lowerZoneW/6); p5.xUpBoundary = hSpacing + 12*(lowerZoneW/6); p5.yUpBoundary = vSpacing + 12*(lowerZoneW/6);
  p6.xLowBoundary = 2*hSpacing + buildingW+3*(upperZoneW/9); p6.yLowBoundary = vSpacing + 2*(upperZoneW/9);
  p7.xLowBoundary = 2*hSpacing + buildingW+12*(upperZoneW/9); p7.yLowBoundary = vSpacing + (upperZoneW/9); p7.xUpBoundary = 2*hSpacing + buildingW+17*(upperZoneW/9); p7.yUpBoundary = vSpacing + 4*(lowerZoneW/6);
  p8.xLowBoundary = 2*hSpacing + buildingW+(upperZoneW/9); p8.yLowBoundary = vSpacing + 9*(upperZoneW/9); p8.xUpBoundary = 2*hSpacing + buildingW+5*(upperZoneW/9); p8.yUpBoundary = vSpacing + 13*(lowerZoneW/6);
  p9.xLowBoundary = 2*hSpacing + buildingW+13*(upperZoneW/9); p9.yLowBoundary = vSpacing + 5*(upperZoneW/9); p9.xUpBoundary = 2*hSpacing + buildingW+17*(upperZoneW/9); p9.yUpBoundary = vSpacing + 13*(lowerZoneW/6);
  p10.xLowBoundary = 2*hSpacing + buildingW+10*(upperZoneW/9); p10.yLowBoundary = vSpacing + 14*(upperZoneW/9); p10.xUpBoundary = 2*hSpacing + buildingW+16*(upperZoneW/9); p10.yUpBoundary = vSpacing + 16*(lowerZoneW/6);
  p11.xLowBoundary = 2*hSpacing + buildingW+6*(upperZoneW/9); p11.yLowBoundary = vSpacing + 6*(upperZoneW/9); p11.xUpBoundary = 2*hSpacing + buildingW+12*(upperZoneW/9); p11.yUpBoundary = vSpacing + 12*(lowerZoneW/6);
  
  p0.xScale = 150; p1.xScale = 125; p2.xScale = 75; p3.xScale = 75; p4.xScale = 150; p5.xScale = 150; p6.xScale = 150; p7.xScale = 125; p8.xScale = 100; p9.xScale = 100; p10.xScale = 150; p11.xScale = 150;
  p0.yScale = 150; p1.yScale = 75; p2.yScale = 75; p3.yScale = 75; p4.yScale = 50; p5.yScale = 150; p6.yScale = 150; p7.yScale = 75; p8.yScale = 100; p9.yScale = 200; p10.yScale = 50; p11.yScale = 150;
  
  //zones are formed in a 3x3 square grid
  z1 = new Zone(hSpacing, vSpacing, lowerZoneW);
  z2 = new Zone(hSpacing + lowerZoneW, vSpacing, lowerZoneW);
  z3 = new Zone(hSpacing + 2*lowerZoneW, vSpacing, lowerZoneW);
  z4 = new Zone(hSpacing, vSpacing + lowerZoneW, lowerZoneW);
  z5 = new Zone(hSpacing + lowerZoneW, vSpacing + lowerZoneW, lowerZoneW);
  z6 = new Zone(hSpacing + 2*lowerZoneW, vSpacing + lowerZoneW, lowerZoneW);
  z7 = new Zone(hSpacing, vSpacing + 2*lowerZoneW, lowerZoneW);
  z8 = new Zone(hSpacing + lowerZoneW, vSpacing + 2*lowerZoneW, lowerZoneW);
  z9 = new Zone(hSpacing + 2*lowerZoneW, vSpacing + 2*lowerZoneW, lowerZoneW);

  //first floor grid lines - first floor is displayed on the left
  //vertical
  g1 = new Grid(hSpacing + (lowerZoneW/6), vSpacing, hSpacing + (lowerZoneW/6), vSpacing + 3*lowerZoneW);
  g2 = new Grid(hSpacing + 2*(lowerZoneW/6), vSpacing, hSpacing + 2*(lowerZoneW/6), vSpacing + 3*lowerZoneW);
  g3 = new Grid(hSpacing + 3*(lowerZoneW/6), vSpacing, hSpacing + 3*(lowerZoneW/6), vSpacing + 3*lowerZoneW);
  g4 = new Grid(hSpacing + 4*(lowerZoneW/6), vSpacing, hSpacing + 4*(lowerZoneW/6), vSpacing + 3*lowerZoneW);
  g5 = new Grid(hSpacing + 5*(lowerZoneW/6), vSpacing, hSpacing + 5*(lowerZoneW/6), vSpacing + 3*lowerZoneW);
  g6 = new Grid(hSpacing + lowerZoneW, vSpacing, hSpacing + lowerZoneW, vSpacing + 3*lowerZoneW);
  g7 = new Grid(hSpacing + 7*(lowerZoneW/6), vSpacing, hSpacing + 7*(lowerZoneW/6), vSpacing + 3*lowerZoneW);
  g8 = new Grid(hSpacing + 8*(lowerZoneW/6), vSpacing, hSpacing + 8*(lowerZoneW/6), vSpacing + 3*lowerZoneW);
  g9 = new Grid(hSpacing + 9*(lowerZoneW/6), vSpacing, hSpacing + 9*(lowerZoneW/6), vSpacing + 3*lowerZoneW);
  g10 = new Grid(hSpacing + 10*(lowerZoneW/6), vSpacing, hSpacing + 10*(lowerZoneW/6), vSpacing + 3*lowerZoneW);
  g11 = new Grid(hSpacing + 11*(lowerZoneW/6), vSpacing, hSpacing + 11*(lowerZoneW/6), vSpacing + 3*lowerZoneW);
  g12 = new Grid(hSpacing + 12*(lowerZoneW/6), vSpacing, hSpacing + 12*(lowerZoneW/6), vSpacing + 3*lowerZoneW);
  g13 = new Grid(hSpacing + 13*(lowerZoneW/6), vSpacing, hSpacing + 13*(lowerZoneW/6), vSpacing + 3*lowerZoneW);
  g14 = new Grid(hSpacing + 14*(lowerZoneW/6), vSpacing, hSpacing + 14*(lowerZoneW/6), vSpacing + 3*lowerZoneW);
  g15 = new Grid(hSpacing + 15*(lowerZoneW/6), vSpacing, hSpacing + 15*(lowerZoneW/6), vSpacing + 3*lowerZoneW);
  g16 = new Grid(hSpacing + 16*(lowerZoneW/6), vSpacing, hSpacing + 16*(lowerZoneW/6), vSpacing + 3*lowerZoneW);
  g17 = new Grid(hSpacing + 17*(lowerZoneW/6), vSpacing, hSpacing + 17*(lowerZoneW/6), vSpacing + 3*lowerZoneW);
  //horizontal
  g18 = new Grid(hSpacing, vSpacing + (lowerZoneW/6), hSpacing + 3*lowerZoneW, vSpacing + (lowerZoneW/6));
  g19 = new Grid(hSpacing, vSpacing + 2*(lowerZoneW/6), hSpacing + 3*lowerZoneW, vSpacing + 2*(lowerZoneW/6));
  g20 = new Grid(hSpacing, vSpacing + 3*(lowerZoneW/6), hSpacing + 3*lowerZoneW, vSpacing + 3*(lowerZoneW/6));
  g21 = new Grid(hSpacing, vSpacing + 4*(lowerZoneW/6), hSpacing + 3*lowerZoneW, vSpacing + 4*(lowerZoneW/6));
  g22 = new Grid(hSpacing, vSpacing + 5*(lowerZoneW/6), hSpacing + 3*lowerZoneW, vSpacing + 5*(lowerZoneW/6));
  g23 = new Grid(hSpacing, vSpacing + lowerZoneW, hSpacing + 3*lowerZoneW, vSpacing + lowerZoneW);
  g24 = new Grid(hSpacing, vSpacing + 7*(lowerZoneW/6), hSpacing + 3*lowerZoneW, vSpacing + 7*(lowerZoneW/6));
  g25 = new Grid(hSpacing, vSpacing + 8*(lowerZoneW/6), hSpacing + 3*lowerZoneW, vSpacing + 8*(lowerZoneW/6));
  g26 = new Grid(hSpacing, vSpacing + 9*(lowerZoneW/6), hSpacing + 3*lowerZoneW, vSpacing + 9*(lowerZoneW/6));
  g27 = new Grid(hSpacing, vSpacing + 10*(lowerZoneW/6), hSpacing + 3*lowerZoneW, vSpacing + 10*(lowerZoneW/6));
  g28 = new Grid(hSpacing, vSpacing + 11*(lowerZoneW/6), hSpacing + 3*lowerZoneW, vSpacing + 11*(lowerZoneW/6));
  g29 = new Grid(hSpacing, vSpacing + 12*(lowerZoneW/6), hSpacing + 3*lowerZoneW, vSpacing + 12*(lowerZoneW/6));
  g30 = new Grid(hSpacing, vSpacing + 13*(lowerZoneW/6), hSpacing + 3*lowerZoneW, vSpacing + 13*(lowerZoneW/6));
  g31 = new Grid(hSpacing, vSpacing + 14*(lowerZoneW/6), hSpacing + 3*lowerZoneW, vSpacing + 14*(lowerZoneW/6));
  g32 = new Grid(hSpacing, vSpacing + 15*(lowerZoneW/6), hSpacing + 3*lowerZoneW, vSpacing + 15*(lowerZoneW/6));
  g33 = new Grid(hSpacing, vSpacing + 16*(lowerZoneW/6), hSpacing + 3*lowerZoneW, vSpacing + 16*(lowerZoneW/6));
  g34 = new Grid(hSpacing, vSpacing + 17*(lowerZoneW/6), hSpacing + 3*lowerZoneW, vSpacing + 17*(lowerZoneW/6));
  
  //second floor grid lines - second floor is displayed on the right
  //vertical
  g35 = new Grid(2*hSpacing+buildingW + (upperZoneW/9), vSpacing, 2*hSpacing+buildingW + (upperZoneW/9), vSpacing + 2*upperZoneW);
  g36 = new Grid(2*hSpacing+buildingW + 2*(upperZoneW/9), vSpacing, 2*hSpacing+buildingW + 2*(upperZoneW/9), vSpacing + 2*upperZoneW);
  g37 = new Grid(2*hSpacing+buildingW + 3*(upperZoneW/9), vSpacing, 2*hSpacing+buildingW + 3*(upperZoneW/9), vSpacing + 2*upperZoneW);
  g38 = new Grid(2*hSpacing+buildingW + 4*(upperZoneW/9), vSpacing, 2*hSpacing+buildingW + 4*(upperZoneW/9), vSpacing + 2*upperZoneW);
  g39 = new Grid(2*hSpacing+buildingW + 5*(upperZoneW/9), vSpacing, 2*hSpacing+buildingW + 5*(upperZoneW/9), vSpacing + 2*upperZoneW);
  g40 = new Grid(2*hSpacing+buildingW + 6*(upperZoneW/9), vSpacing, 2*hSpacing+buildingW + 6*(upperZoneW/9), vSpacing + 2*upperZoneW);
  g41 = new Grid(2*hSpacing+buildingW + 7*(upperZoneW/9), vSpacing, 2*hSpacing+buildingW + 7*(upperZoneW/9), vSpacing + 2*upperZoneW);
  g42 = new Grid(2*hSpacing+buildingW + 8*(upperZoneW/9), vSpacing, 2*hSpacing+buildingW + 8*(upperZoneW/9), vSpacing + 2*upperZoneW);
  g43 = new Grid(2*hSpacing+buildingW + upperZoneW, vSpacing, 2*hSpacing+buildingW + upperZoneW, vSpacing + 2*upperZoneW);
  g44 = new Grid(2*hSpacing+buildingW + 10*(upperZoneW/9), vSpacing, 2*hSpacing+buildingW + 10*(upperZoneW/9), vSpacing + 2*upperZoneW);
  g45 = new Grid(2*hSpacing+buildingW + 11*(upperZoneW/9), vSpacing, 2*hSpacing+buildingW + 11*(upperZoneW/9), vSpacing + 2*upperZoneW);
  g46 = new Grid(2*hSpacing+buildingW + 12*(upperZoneW/9), vSpacing, 2*hSpacing+buildingW + 12*(upperZoneW/9), vSpacing + 2*upperZoneW);
  g47 = new Grid(2*hSpacing+buildingW + 13*(upperZoneW/9), vSpacing, 2*hSpacing+buildingW + 13*(upperZoneW/9), vSpacing + 2*upperZoneW);
  g48 = new Grid(2*hSpacing+buildingW + 14*(upperZoneW/9), vSpacing, 2*hSpacing+buildingW + 14*(upperZoneW/9), vSpacing + 2*upperZoneW);
  g49 = new Grid(2*hSpacing+buildingW + 15*(upperZoneW/9), vSpacing, 2*hSpacing+buildingW + 15*(upperZoneW/9), vSpacing + 2*upperZoneW);
  g50 = new Grid(2*hSpacing+buildingW + 16*(upperZoneW/9), vSpacing, 2*hSpacing+buildingW + 16*(upperZoneW/9), vSpacing + 2*upperZoneW);
  g51 = new Grid(2*hSpacing+buildingW + 17*(upperZoneW/9), vSpacing, 2*hSpacing+buildingW + 17*(upperZoneW/9), vSpacing + 2*upperZoneW);
  //horizontal
  g52 = new Grid(2*hSpacing + buildingW, vSpacing + (upperZoneW/9), 2*hSpacing + buildingW+2*upperZoneW, vSpacing + (upperZoneW/9));
  g53 = new Grid(2*hSpacing + buildingW, vSpacing + 2*(upperZoneW/9), 2*hSpacing + buildingW+2*upperZoneW, vSpacing + 2*(upperZoneW/9));
  g54 = new Grid(2*hSpacing + buildingW, vSpacing + 3*(upperZoneW/9), 2*hSpacing + buildingW+2*upperZoneW, vSpacing + 3*(upperZoneW/9));
  g55 = new Grid(2*hSpacing + buildingW, vSpacing + 4*(upperZoneW/9), 2*hSpacing + buildingW+2*upperZoneW, vSpacing + 4*(upperZoneW/9));
  g56 = new Grid(2*hSpacing + buildingW, vSpacing + 5*(upperZoneW/9), 2*hSpacing + buildingW+2*upperZoneW, vSpacing + 5*(upperZoneW/9));
  g57 = new Grid(2*hSpacing + buildingW, vSpacing + 6*(upperZoneW/9), 2*hSpacing + buildingW+2*upperZoneW, vSpacing + 6*(upperZoneW/9));
  g58 = new Grid(2*hSpacing + buildingW, vSpacing + 7*(upperZoneW/9), 2*hSpacing + buildingW+2*upperZoneW, vSpacing + 7*(upperZoneW/9));
  g59 = new Grid(2*hSpacing + buildingW, vSpacing + 8*(upperZoneW/9), 2*hSpacing + buildingW+2*upperZoneW, vSpacing + 8*(upperZoneW/9));
  g60 = new Grid(2*hSpacing + buildingW, vSpacing + upperZoneW, 2*hSpacing + buildingW+2*upperZoneW, vSpacing + upperZoneW);
  g61 = new Grid(2*hSpacing + buildingW, vSpacing + 10*(upperZoneW/9), 2*hSpacing + buildingW+2*upperZoneW, vSpacing + 10*(upperZoneW/9));
  g62 = new Grid(2*hSpacing + buildingW, vSpacing + 11*(upperZoneW/9), 2*hSpacing + buildingW+2*upperZoneW, vSpacing + 11*(upperZoneW/9));
  g63 = new Grid(2*hSpacing + buildingW, vSpacing + 12*(upperZoneW/9), 2*hSpacing + buildingW+2*upperZoneW, vSpacing + 12*(upperZoneW/9));
  g64 = new Grid(2*hSpacing + buildingW, vSpacing + 13*(upperZoneW/9), 2*hSpacing + buildingW+2*upperZoneW, vSpacing + 13*(upperZoneW/9));
  g65 = new Grid(2*hSpacing + buildingW, vSpacing + 14*(upperZoneW/9), 2*hSpacing + buildingW+2*upperZoneW, vSpacing + 14*(upperZoneW/9));
  g66 = new Grid(2*hSpacing + buildingW, vSpacing + 15*(upperZoneW/9), 2*hSpacing + buildingW+2*upperZoneW, vSpacing + 15*(upperZoneW/9));
  g67 = new Grid(2*hSpacing + buildingW, vSpacing + 16*(upperZoneW/9), 2*hSpacing + buildingW+2*upperZoneW, vSpacing + 16*(upperZoneW/9));
  g68 = new Grid(2*hSpacing + buildingW, vSpacing + 17*(upperZoneW/9), 2*hSpacing + buildingW+2*upperZoneW, vSpacing + 17*(upperZoneW/9));
  
  //first floor
  gridLines[0] = g1; gridLines[1] = g2; gridLines[2] = g3; gridLines[3] = g4; gridLines[4] = g5; gridLines[5] = g6; gridLines[6] = g7; gridLines[7] = g8; gridLines[8] = g9; gridLines[9] = g10; gridLines[10] = g11; gridLines[11] = g12; gridLines[12] = g13;
  gridLines[13] = g14; gridLines[14] = g15; gridLines[15] = g16; gridLines[16] = g17; gridLines[17] = g18; gridLines[18] = g19; gridLines[19] = g20; gridLines[20] = g21; gridLines[21] = g22; gridLines[22] = g23; gridLines[23] = g24; gridLines[24] = g25;
  gridLines[25] = g26; gridLines[26] = g27; gridLines[27] = g28; gridLines[28] = g29; gridLines[29] = g30; gridLines[30] = g31; gridLines[31] = g32; gridLines[32] = g33; gridLines[33] = g34;
  
  //second floor
  gridLines[34] = g35; gridLines[35] = g36; gridLines[36] = g37; gridLines[37] = g38; gridLines[38] = g39; gridLines[39] = g40; gridLines[40] = g41; gridLines[41] = g42; gridLines[42] = g43; gridLines[43] = g44; gridLines[44] = g45; gridLines[45] = g46;
  gridLines[46] = g47; gridLines[47] = g48; gridLines[48] = g49; gridLines[49] = g50; gridLines[50] = g51; gridLines[51] = g52; gridLines[52] = g53; gridLines[53] = g54; gridLines[54] = g55; gridLines[55] = g56; gridLines[56] = g57; gridLines[57] = g58;
  gridLines[58] = g59;gridLines[59] = g60; gridLines[60] = g61; gridLines[61] = g62; gridLines[62] = g63; gridLines[63] = g64; gridLines[64] = g65; gridLines[65] = g66; gridLines[66] = g67; gridLines[67] = g68;
  
  zones[0] = z1; zones[1] = z2; zones[2] = z3; zones[3] = z4; zones[4] = z5; zones[5] = z6; zones[6] = z7; zones[7] = z8; zones[8] = z9; 
  
  //each pod links to all of the zones it's in
  //upstairs pods link to the zones below it
  p0.zones.add(z1); p0.zones.add(z2);p0.zones.add(z4);
  p1.zones.add(z3);
  p2.zones.add(z4); p2.zones.add(z7);
  p3.zones.add(z6); 
  p4.zones.add(z8); p4.zones.add(z9);
  p5.zones.add(z5);
  p6.zones.add(z1); p6.zones.add(z2); p6.zones.add(z4);
  p7.zones.add(z3);
  p8.zones.add(z4); p8.zones.add(z7);
  p9.zones.add(z3); p9.zones.add(z6); p9.zones.add(z9);
  p10.zones.add(z8); p10.zones.add(z9);
  p11.zones.add(z5);
  
  //and vise versa, each zone links to any pod that is in it
  z1.pods.add(p0); z2.pods.add(p0); z4.pods.add(p0);
  z3.pods.add(p1);
  z4.pods.add(p2); z7.pods.add(p2);
  z6.pods.add(p3);
  z8.pods.add(p4); z9.pods.add(p4);
  z5.pods.add(p5);
  
  //set the initial temperatures of the outside pods: 5 and 11
  p5.temp = 15.9;
  p11.temp = 15.9;
    
  p3.rate = 1.2;
  p4.rate = 1.2;
  p5.rate = 0.5;
  p11.rate = 0.5;
  p6.rate = 0.8;
  p7.rate = 0.8;
  p8.rate = 0.8;
  p9.rate = 0.8;
  p10.rate = 0.8;
}

void draw(){

  background(255);
  stroke(0);
  noFill();
 
  for(int i = 0; i < 9; i++){
    zones[i].delta = 0;
  }
  
  //heat dispersion between zones
  //zone 1
  if(z2.temp > z1.temp){
    z1.delta += rate*incr;
    z2.delta -= rate*incr;
  }
  if(z4.temp > z1.temp){
    z1.delta += rate*incr;
    z4.delta -= rate*incr;
  }  
  //zone 2
  if(z1.temp>z2.temp){
    z2.delta += rate*incr;
    z1.delta -= rate*incr;
  }
  if(z3.temp>z2.temp){
    z2.delta += rate*incr;
    z3.delta -= rate*incr;
  }
  if(z5.temp>z2.temp){
    z2.delta += rate*incr;
    z5.delta -= rate*incr;
  }
  //zone 3
  if(z2.temp>z3.temp){
    z3.delta += rate*incr;
    z2.delta -= rate*incr;
  }
  if(z6.temp>z3.temp){
    z3.delta += rate*incr;
    z6.delta -= rate*incr;
  }
  //zone 4
  if(z1.temp>z4.temp){
    z4.delta += rate*incr;
    z4.delta -= rate*incr;
  }
  if(z5.temp>z4.temp){
    z4.delta += rate*incr;
    z5.delta -= rate*incr;
  }
  if(z7.temp>z4.temp){
    z4.delta += rate*incr;
    z7.delta -= rate*incr;
  }
  //zone 5
  if(z2.temp>z5.temp){
    z5.delta += rate*incr;
    z2.delta -= rate*incr;
  }
  if(z4.temp>z5.temp){
    z5.delta += rate*incr;
    z4.delta -= rate*incr;
  }
  if(z6.temp>z5.temp){
    z5.delta += rate*incr;
    z6.delta -= rate*incr;
  }
  if(z8.temp>z5.temp){
    z5.delta += rate*incr;
    z8.delta -= rate*incr;
  }
  //zone 6
  if(z3.temp>z6.temp){
    z6.delta += rate*incr;
    z3.delta -= rate*incr;
  }
  if(z5.temp>z6.temp){
    z6.delta += rate*incr;
    z5.delta -= rate*incr;
  }
  if(z9.temp>z6.temp){
    z6.delta += rate*incr;
    z9.delta -= rate*incr;
  }
  //zone 7
  if(z4.temp>z7.temp){
    z7.delta += rate*incr;
    z4.delta -= rate*incr;
  }
  if(z8.temp>z7.temp){
    z7.delta += rate*incr;
    z8.delta -= rate*incr;
  }
  //zone 8
  if(z7.temp>z8.temp){
    z8.delta += rate*incr;
    z7.delta -= rate*incr;
  }
  if(z5.temp>z8.temp){
    z8.delta += rate*incr;
    z5.delta -= rate*incr;
  }
  if(z9.temp>z8.temp){
    z8.delta += rate*incr;
    z9.delta -= rate*incr;
  }
  //zone 9
  if(z6.temp>z9.temp){
    z9.delta += rate*incr;
    z6.delta -= rate*incr;
  }
  if(z8.temp>z9.temp){
    z9.delta += rate*incr;
    z8.delta -= rate*incr;
  }
  
  //heat dispersion from pods 0 and 4 to the second floor (because these pods have openings to the second floor)
  if(p0.temp>p6.temp){
    p6.delta += 0.005*rate*incr;
    p0.delta -= 0.005*rate*incr;
  }
  if(p4.temp>p10.temp){
    p10.delta += 0.0005*rate*incr;
    p4.delta -= 0.0005*rate*incr;
  }
  
  //thermostat rules in terms of time
  //check pods
  for(int i = 0; i<11;i++){
    //pod is inactive and at comfortable room temp for too long - count time
    if(pods[i].active == 0 && pods[i].temp >= 16.3 && pods[i].temp <21){
      pods[i].time ++;
    }else if(pods[i].active != 0){
      pods[i].time = 0;
    }
    else if(pods[i].temp < 17 && pods[i].temp >21){
      pods[i].time = 0;
    }
    //pod is inactive and at comfortable room temp for too long - randomly increase or decrease the temperature of its corresponding zones
    if(pods[i].time > 1000 && pods[i].time < 1300){
      if(pods[i].choice == 0){ //increase temp
        for(int j = 0; j<pods[i].zones.size();j++){
          pods[i].zones.get(j).temp += 3*incr;
          pods[i].zones.get(j).time = 0;
        }
      }else if(pods[i].choice == 1){ //decrease temp
        for(int j = 0; j<pods[i].zones.size();j++){
          pods[i].zones.get(j).temp -= 3*incr;
          pods[i].zones.get(j).time = 0;
        }
      }
    //the temperature change causes movement of people
    }else if(pods[i].time >=1300){
      int rand = (int)random(2,4);
      for(int k = 0; k < Pnum; k++){
        //choose random people that are in the pod
        if(k%rand == 0){
          if(people.get(k).pod == pods[i]){
            //the random people either stay or move to one of the pod's corresponding zones
            int choice = (int)random(0,pods[i].zones.size()-1);
            float x = random(pods[i].zones.get(choice).xCorner, pods[i].zones.get(choice).xCorner + pods[i].zones.get(choice).dim);
            float y = random(pods[i].zones.get(choice).yCorner, pods[i].zones.get(choice).yCorner + pods[i].zones.get(choice).dim);
            people.get(k).xloc = x;
            people.get(k).yloc = y;
             
            //antagonistic mode
            /*
            if(pods[i].choice == 0){  //if the temp in the pod just went up, the random people either stay or move to one of the pod's corresponding zones
              int choice = (int)random(0,pods[i].zones.size()-1);
              float x = random(pods[i].zones.get(choice).xCorner, pods[i].zones.get(choice).xCorner + pods[i].zones.get(choice).dim);
              float y = random(pods[i].zones.get(choice).yCorner, pods[i].zones.get(choice).yCorner + pods[i].zones.get(choice).dim);
              people.get(k).xloc = x;
              people.get(k).yloc = y;
            }else if(pods[i].choice == 1){ //else if the temp just went down, other random people come here to the pod or one of the pod's corresponding zones
              int random = (int)random(0,Pnum);
              int choice = (int)random(0,pods[i].zones.size()-1);
              float x = random(pods[i].zones.get(choice).xCorner, pods[i].zones.get(choice).xCorner + pods[i].zones.get(choice).dim);
              float y = random(pods[i].zones.get(choice).yCorner, pods[i].zones.get(choice).yCorner + pods[i].zones.get(choice).dim);
              people.get(random).xloc = x;
              people.get(random).yloc = y;
            }*/
          }
        }
      }
      pods[i].time = 0;
      pods[i].choice = (int)random(0,2);
    }
    //pod is too hot - count time
    if(pods[i].temp >= 24){
      pods[i].time2++;
    }
    //pod is too hot - change temp and move people
    if (pods[i].time2>300){
      //decrease the temperature of the corresponding zones to get people to move there
      for(int j = 0; j< pods[i].zones.size();j++){
        pods[i].zones.get(j).temp -= 3*incr;
      }
      int rand = (int)random(2,4);
      for(int k = 0; k < Pnum; k++){
        //choose random people that are in the pod
        if(k%rand ==0){
          if(people.get(k).pod == pods[i]){
            //the random people either stay or move to one of the pod's corresponding zones
            int choice = (int)random(0,pods[i].zones.size()-1);
            float x = pods[i].zones.get(choice).xCorner + random(0,100);
            float y = pods[i].zones.get(choice).yCorner + random(0,100);;
            people.get(k).xloc = x;
            people.get(k).yloc = y;
            pods[i].active--;
            //decrease the pod's temp when a person leaves
            pods[i].temp -= 2*incr*rate;
          }
        }
      }
      pods[i].time2 = 0;
    }
  }
  
  //check zones
  for(int i = 0; i<9; i++){
    //zone is inactive and at comfortable room temp for too long - count time
    if(zones[i].active == 0 && zones[i].temp >= 17 && zones[i].temp < 21){
      zones[i].time++;
    }else if(zones[i].active != 0){
      zones[i].time = 0;
    }else if(zones[i].temp < 17 && zones[i].temp >21){
      zones[i].time = 0;
    }
    //zone is inactive and at comfortable room temp for too long - randomly increase or decrease temp of its corresponding pods
    if(zones[i].time > 1000 && zones[i].time < 1300){
      if(zones[i].choice == 0){  //increase temp
        for(int j = 0; j<zones[i].pods.size();j++){
          zones[i].pods.get(j).temp += 3*rate*incr;
          zones[i].pods.get(j).time = 0;
        }
      }else if(zones[i].choice == 1){ //decrease temp
        for(int j = 0; j<zones[i].pods.size();j++){
          zones[i].pods.get(j).temp -= 3*rate*incr;
          zones[i].pods.get(j).time = 0;
        }
      }
    //the temperature change causes movement of people
    }else if(zones[i].time >= 1300){
      int rand = (int)random(2,4);
      for(int k = 0; k < Pnum; k++){
        //choose random people that are in the zone
        if(k%rand ==0){
          if(people.get(k).zone == zones[i]){
            //the random people either stay or move to one of the zone's corresponding pods
            int choice = (int)random(0,zones[i].pods.size()-1);
            float x = zones[i].pods.get(choice).xLowBoundary + random(0,70);
            float y = zones[i].pods.get(choice).yLowBoundary + random(0,70);
            people.get(k).xloc = x;
            people.get(k).yloc = y;
            
            //antagonistic mode
            /*
            if(zones[i].choice == 0){  //if the temp in the zone just went up, the random people either stay or move to one of the zone's corresponding pods
              int choice = (int)random(0,zones[i].pods.size()-1);
              float x = zones[i].pods.get(choice).xLowBoundary + random(0,70);
              float y = zones[i].pods.get(choice).yLowBoundary + random(0,70);
              people.get(k).xloc = x;
              people.get(k).yloc = y;
            }else if(zones[i].choice == 1){ //else if the temp just went down, other random people come to this zone
              int random = (int)random(0,Pnum);
              float x = random(zones[i].xCorner, zones[i].xCorner + zones[i].dim);
              float y = random(zones[i].yCorner, zones[i].yCorner + zones[i].dim);
              people.get(random).xloc = x;
              people.get(random).yloc = y;
            }*/
          }
        }
      }
      zones[i].time = 0;
      zones[i].choice = (int)random(0,2);
    }
    //zone is too hot - count time
    if(zones[i].temp >= 24){
      zones[i].time2++;
    }
    //zone is too hot - change temp and move people
    if (zones[i].time2>300){
      //decrease the temperature of the corresponding pods to get people to move there
      for(int j = 0; j< zones[i].pods.size();j++){
        zones[i].pods.get(j).temp -= 3*incr;
      }
      int rand = (int)random(2,4);
      for(int k = 0; k < Pnum; k++){
        //choose random people that are in the zone
        if(k%rand ==0){
          if(people.get(k).zone == zones[i]){
            //move these random people to one of the zone's corresponding pods
            int choice = (int)random(0,zones[i].pods.size()-1);
            float x = zones[i].pods.get(choice).xLowBoundary + random(0,70);
            float y = zones[i].pods.get(choice).yLowBoundary + random(0,70);
            people.get(k).xloc = x;
            people.get(k).yloc = y;
            zones[i].active--;
            //decrease the zones's temp when a person leaves
            zones[i].temp -= 2*incr*rate;
          }
        }
      } 
      zones[i].time2 = 0;
    }
  }
  
  //delete person
  if(keyPressed && key == CODED && keyCode == SHIFT && clicked && mouseButton == LEFT){
    for(int i = 0; i<Pnum;i++){
      if(dist(people.get(i).xloc,people.get(i).yloc,mouseX,mouseY)<10){
        people.remove(i);
      }
    }
  }
  //set location of person
  else {
    if(clicked && mouseButton == LEFT && 
    //only if user clicked within boundaries of the building or in pods 6, 7, 8, 9, or 10
    ((mouseX > hSpacing && mouseX < hSpacing + buildingW && mouseY > vSpacing && mouseY < vSpacing + buildingW) ||
    ((mouseX > 2*hSpacing + buildingW+3*(upperZoneW/9)+5 && mouseX < 2*hSpacing + buildingW+5*(upperZoneW/9)-5 && mouseY > vSpacing + 2*(upperZoneW/9)+5 && mouseY < vSpacing + 8*(upperZoneW/9)-5)||(mouseX > 2*hSpacing + buildingW+3*(upperZoneW/9)+5 && mouseX < 2*hSpacing + buildingW+9*(upperZoneW/9)-5 && mouseY > vSpacing + 2*(upperZoneW/9)+5 && mouseY < vSpacing + 4*(upperZoneW/9)-5)) ||
    (mouseX > p7.xLowBoundary+5 && mouseX < p7.xUpBoundary-5 && mouseY> p7.yLowBoundary + 5 && mouseY < p7.yUpBoundary -5) ||
    (mouseX > p8.xLowBoundary+5 && mouseX < p8.xUpBoundary-5 && mouseY> p8.yLowBoundary + 5 && mouseY < p8.yUpBoundary -5) ||
    (mouseX > p9.xLowBoundary+5 && mouseX < p9.xUpBoundary-5 && mouseY> p9.yLowBoundary + 5 && mouseY < p9.yUpBoundary -5) ||
    (mouseX > p10.xLowBoundary+5 && mouseX < p10.xUpBoundary-5 && mouseY> p10.yLowBoundary + 5 && mouseY < p10.yUpBoundary -5))){ 
      people.get(Pnum).draw = true;
      people.get(Pnum).time += 5;
      people.get(Pnum).xloc = mouseX;
      people.get(Pnum).yloc = mouseY;
      Pnum++;
    }
  }
  
  //draw zones
  for (int i = 0; i < 9; i++){
    zones[i].temp += zones[i].delta;
    zones[i].sketch();
  }

  //draw pods
  for(int i = 0; i < 12; i++){
    pods[i].temp += pods[i].delta;
    pods[i].pSketch();
  }
  
  //draw grid lines
  for (int i = 0; i <68; i++){
    gridLines[i].gSketch();
  }
  
  //redraw people
  for(int i = 0; i < Pnum; i++){
    if(people.get(i).draw == true){
      people.get(i).redraw();
    }
  }
  
  //reset number of people in each pod to zero
  for(int i = 0; i < 11; i++){
    pods[i].people = 0;
  }
 
  //reset number of people in each zone to zero
  for(int i = 0; i < 9; i++){
   zones[i].people = 0;
  }
 
  //count the number of people in each pod/zone and draw people
  for(int i = 0; i<Pnum; i++){
    //check if person is in a pod - if it is, store which pod it is in and add one to the number of people in that pod
    //pod 0
    if((people.get(i).xloc > hSpacing + 3*(lowerZoneW/6)+5 && people.get(i).xloc < hSpacing + 5*(lowerZoneW/6)-5 && people.get(i).yloc > vSpacing + 2*(lowerZoneW/6)+5 && people.get(i).yloc < vSpacing + 8*(lowerZoneW/6)-5)||(people.get(i).xloc > hSpacing + 3*(lowerZoneW/6)+5 && people.get(i).xloc < hSpacing + 9*(lowerZoneW/6)-5 && people.get(i).yloc > vSpacing + 2*(lowerZoneW/6)+5 && people.get(i).yloc < vSpacing + 4*(lowerZoneW/6)-5)){
      people.get(i).pod = p0;
      people.get(i).pod.people ++;
      people.get(i).inPod = true;
    }
    //pod 6
    else if((people.get(i).xloc > 2*hSpacing + buildingW+3*(upperZoneW/9)+5 && people.get(i).xloc < 2*hSpacing + buildingW+5*(upperZoneW/9)-5 && people.get(i).yloc > vSpacing + 2*(upperZoneW/9)+5 && people.get(i).yloc < vSpacing + 8*(upperZoneW/9)-5)||(people.get(i).xloc > 2*hSpacing + buildingW+3*(upperZoneW/9)+5 && people.get(i).xloc < 2*hSpacing + buildingW+9*(upperZoneW/9)-5 && people.get(i).yloc > vSpacing + 2*(upperZoneW/9)+5 && people.get(i).yloc < vSpacing + 4*(upperZoneW/9)-5)){
      people.get(i).pod = p6;
      people.get(i).pod.people ++;
      people.get(i).inPod = true;
    }
    //pod 5
    else if(dist(people.get(i).xloc, people.get(i).yloc, hSpacing + 9*(lowerZoneW/6), vSpacing + 9*(lowerZoneW/6)) < lowerZoneW/2-5){
      people.get(i).pod = p5;
      people.get(i).pod.people ++;
      people.get(i).inPod = true;
    }
    else{
      //rest of the pods
      for(int j = 1; j<11;j++){
        if(j != 6 && j != 5){
          if(people.get(i).xloc > pods[j].xLowBoundary+5 && people.get(i).xloc < pods[j].xUpBoundary-5 && people.get(i).yloc> pods[j].yLowBoundary + 5 && people.get(i).yloc < pods[j].yUpBoundary -5){
            people.get(i).pod = pods[j];
            people.get(i).pod.people ++;
            people.get(i).inPod = true;
           }else{
             //if person's not in a pod, store which zone it's in and add one to the number of people in that zone
             for(int k = 0; k<9; k++){
               if(people.get(i).xloc > zones[k].xCorner && people.get(i).xloc < zones[k].xCorner + zones[k].dim  && people.get(i).yloc > zones[k].yCorner && people.get(i).yloc < zones[k].yCorner + zones[k].dim){
                 people.get(i).zone = zones[k]; 
                 people.get(i).zone.people ++;
               }
             }
           }
         }
       }
     }
     people.get(i).sketch();
   }

  //time decay and activity decay
  for(int i = 0; i<Pnum; i++){
    if(people.get(i).time>0){
      people.get(i).time = people.get(i).time - 0.05;
      if(people.get(i).time == 0){
        if(people.get(i).inPod){
          people.get(i).pod.active --;
        }else{
          people.get(i).zone.active --;
        }
        people.get(i).active = false;
      }
    }
  }
 
  //activate activity - when user right clicks on a person
  if(clicked && mouseButton == RIGHT){
    for(int j = 0; j < Pnum; j++){
      if(dist(people.get(j).xloc,people.get(j).yloc,mouseX,mouseY)<people.get(j).radius+2){
        if(people.get(j).active == false){
          if(people.get(j).inPod){
            people.get(j).pod.active++;
          }else{
            people.get(j).zone.active++;
          }
          people.get(j).active = true;
        }
        people.get(j).time += 20;
      }
    }
  }
  
  //temperature rate growth based on number of people and amount of activity in the space
  for(int i = 0; i < Pnum;i++){
    if(people.get(i).time > 0){
      //in pod
      if(people.get(i).inPod){
        if(people.get(i).pod.temp <= 24){
          people.get(i).pod.temp += people.get(i).pod.people*incr*rate;
          people.get(i).pod.temp += people.get(i).pod.active*incr*rate;
        }
      //in zone
      }else{
        if(people.get(i).zone.temp <= 24){
          people.get(i).zone.temp += 0.5*people.get(i).zone.people*incr;
          people.get(i).zone.temp += people.get(i).zone.active*incr;
        }
      }
    }
  }
  p11.temp = p5.temp; //pods 5 and 11 are technically the same pod because pod 5 is completely open to the second floor - pod 11 is just the second floor representation of pod 5
  
  //check how many people are in the central pod (pod 5) or the central zone (zone 5)
  central = 0;
  for(int i = 0; i<Pnum; i++){
    if(dist(hSpacing + 9*(lowerZoneW/6), vSpacing + 9*(lowerZoneW/6), people.get(i).xloc, people.get(i).yloc) -(lowerZoneW/2)< 15){
      central++;
    }
  }
  //if there's more than 5 people in the central area (pod 5 and zone 5) - condensation forms
  if(central > 5 && numC<1000){
    for(int i = 0; i < 5; i++){
      float rad = random(0,75);
      float sign = random(-1,1);
      float x = random(-75,75);
      float y = sqrt(sq(rad)-sq(x))*sign;
      PVector loc = new PVector(hSpacing + 9*(lowerZoneW/6)+x,vSpacing + 9*(lowerZoneW/6)+y);
      PVector loc2 = new PVector(2*hSpacing + buildingW+9*(upperZoneW/9)+x, vSpacing + 9*(upperZoneW/9)+y);
      condensation[numC + i] = loc; //first floor condensation
      Ucondensation[numC + i] = loc2; //upper (second) floor condensation
    }
    numC += 5;
  }
  
  /*tubes from pods 0 and 4 bring warm air to pod 5
  so if the temperatures in pods 0 or 4 increase due to the presense of people, 
  some of that warm air is brought to pod 5 as well*/
  if(p0.people > 2 || p4.people > 2){
    tubes ++;
  }
  //if enough warm air travels to pod 5 - condensation forms
  if(tubes > 500 && numC<1000){
    for(int i = 0; i < 5; i++){
      float rad = random(0,75);
      float sign = random(-1,1);
      float x = random(-75,75);
      float y = sqrt(sq(rad)-sq(x))*sign;
      PVector loc = new PVector(hSpacing + 9*(lowerZoneW/6)+x,vSpacing + 9*(lowerZoneW/6)+y);
      PVector loc2 = new PVector(2*hSpacing + buildingW+9*(upperZoneW/9)+x, vSpacing + 9*(upperZoneW/9)+y);
      condensation[numC + i] = loc; //first floor condensation 
      Ucondensation[numC + i] = loc2; //upper (second) floor condensation
    }
    numC+= 5;
  }
  //draw condensation
  for(int i = 0; i< numC;i++){
    strokeWeight(1.5);
    point(condensation[i].x, condensation[i].y);
    point(Ucondensation[i].x, Ucondensation[i].y);
  }
clicked = false;
}


void mouseClicked(){
   
  clicked = true;
}
