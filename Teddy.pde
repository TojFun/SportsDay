class Teddy {
  float x, y;
  Teddy() {
  }

  void display() {
color brown = #A5674B;
color yellow = #FFDFA0;
color black = #3E2207;
color white = #FAEDE1;

    float x = width/2;
    float y = height/2;
    float size = 1;

  fill(brown);
  rect(x-56, y-10, size*32, size*83, 8, 8, 8, 8);    //leftest leg 
  rect(x-44, y-10, size*32, size*83, 8, 8, 8, 8);    //left leg
  rect(x+12, y-10, size*32, size*83, 8, 8, 8, 8);   //right leg
  rect(x+26, y-10, size*32, size*83, 8, 8, 8, 8);   //rightest leg
  circle(x+67, y-26, size*33); 
  
  ellipse(x, y, size*137, size*90);      //body
  
  circle(x-92, y-52, size*26);           //ear left
  circle(x-41, y-52, size*26);           //ear right
  fill(yellow);
  circle(x-93, y-51, size*19);     //inner ear left
  circle(x-43, y-50, size*20);     //right
  
  fill(brown);
  circle(x-69, y-23, size*70);           //head 
  
  fill(yellow);
  ellipse(x-76, y-12, size*36, size*24); //mouth
  
  fill(black);
  circle(x-94, y-26, size*16); //left eye
  circle(x-55, y-27, size*17); //right
  triangle(x-90 ,y-15 ,x-72 ,y-14 ,x-78 ,y-7);  //nose
  
  fill(white);
  circle(x-91, y-28, size*8);      //left shine
  circle(x-53, y-29, size*9);      //right 
   }

  void attackFarm(Farm farm) {
  }

  void goAway() {
  }
}
