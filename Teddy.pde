class Teddy {
  float x, y, scale;

  Teddy(float x, float y, float scale) {
    this.x = x;
    this.y = y;

    this.scale = scale;
  }

  void display() {
    pushMatrix();

    translate(x, y);
    scale(scale);

    color brown = #A5674B;
    color yellow = #FFDFA0;
    color black = #3E2207;
    color white = #FAEDE1;

    fill(brown);
    rect(-56, -10, 32, 83, 8, 8, 8, 8);    //leftest leg
    rect(-44, -10, 32, 83, 8, 8, 8, 8);    //left leg
    rect(12, -10, 32, 83, 8, 8, 8, 8);   //right leg
    rect(26, -10, 32, 83, 8, 8, 8, 8);   //rightest leg
    circle(67, -26, 33);

    ellipse(0, 0, 137, 90);      //body

    circle(-92, -52, 26);           //ear left
    circle(-41, -52, 26);           //ear right
    fill(yellow);
    circle(-93, -51, 19);     //inner ear left
    circle(-43, -50, 20);     //right

    fill(brown);
    circle(-69, -23, 70);           //head

    fill(yellow);
    ellipse(-76, -12, 36, 24); //mouth

    fill(black);
    circle(-94, -26, 16); //left ee
    circle(-55, -27, 17); //right
    triangle(-90, -15, -72, -14, -78, -7);  //nose

    fill(white);
    circle(-91, -28, 8);      //left shine
    circle(-53, -29, 9);      //right

    popMatrix();
  }

  void attackFarm(Farm farm) {
  }

  void goAway() {
  }
}
