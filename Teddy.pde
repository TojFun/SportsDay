class Teddy {
  float x, y, scale;
  int speed;
  float stepSpeed = 0;

  boolean backwards = false;
  boolean hugging = false;
  boolean leaving = false;
  int hugStartTime;

  color brown = #A5674B;
  color yellow = #FFDFA0;
  color black = #3E2207;
  color white = #FAEDE1;
  color pink = #F0A89D;

  Teddy(float x, float y, float scale, int speed) {
    this.x = x;
    this.y = y;

    this.scale = scale;

    this.speed = speed;
  }

  void display() {
    if (hugging) {
      hug();
      return;
    }

    pushMatrix();

    translate(x, y);
    if (backwards) {
      scale(-scale, scale);
    } else {
      scale(scale);
    }

    float stepHeight = 4;
    stepSpeed += 0.2;

    float walk1 = sin(stepSpeed)*stepHeight;
    float walk2 = cos(stepSpeed)*stepHeight;

    fill(brown);
    rect(-56, -10 + walk1, 32, 83, 8, 8, 8, 8);    //leftest leg
    rect(-44, -10 + walk2, 32, 83, 8, 8, 8, 8);    //left leg
    rect(12, -10 + walk1, 32, 83, 8, 8, 8, 8);   //right leg
    rect(26, -10 + walk2, 32, 83, 8, 8, 8, 8);   //rightest leg
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

  void move(Farm farm, Farmer farmer) {

    // Bear is leaving after hugging
    if (leaving) {
      goAway();
      return;
    }

    // Bear is currently hugging
    if (hugging) {
      if (millis() - hugStartTime >= 900) {
        hugging = false;
        leaving = true;
      }
      return;
    }

    // Check whether farmer meets bear
    if (!farm.isHugging() &&
      dist(x, y, farmer.x, farmer.y) < 60) {

      hugging = true;
      hugStartTime = millis();
      farm.hearts++;

      farmer.targetX = farmer.x;
      farmer.targetY = farmer.y;
      farmer.isWalking = false;

      return;
    }

    // Normal bear movement toward farm
    float dx = farm.x - x;
    float dy = farm.y - y;

    float distance = sqrt(dx * dx + dy * dy);

    if (distance > speed) {
      x += dx / distance * speed;
      y += dy / distance * speed;
    }

    if (dx >= 0) {
      backwards = true;
    } else {
      backwards = false;
    }

    // Check whether bear reaches a farm plot
    for (Plot plot : farm.plots) {
      if (x >= plot.x &&
        x <= plot.x + plot.width &&
        y >= plot.y &&
        y <= plot.y + plot.height) {

        farm.bearIntrusion(this, plot);
        break;
      }
    }
  }

  void goAway() {
    float dx = x - width / 2.0;
    float dy = y - height / 2.0;
    float distance = sqrt(dx * dx + dy * dy);

    if (distance < 0.001) {
      dx = 1;
      dy = 0;
      distance = 1;
    }

    x += (dx / distance) * 4;
    y += (dy / distance) * 4;
    backwards = dx > 0;
  }

  void hug() {
    pushMatrix();
    translate(x, y);
    scale(0.4);
    translate(-400, -400);

    fill(brown);
    rect(353, 398, 32, 74, 8, 8, 8, 8);    //leftest leg
    circle(450, 412, 33);                  //tail
    ellipse(400, 376, 90, 135);            //body
    rect(414, 404, 32, 74, 8, 8, 8, 8);    //rightest leg
    circle(390, 320, 70);                  //head
    circle(358, 309, 26);                  //ear left
    circle(418, 308, 26);                  //ear right

    fill(black);
    circle(372, 340, 16);                  //left eye
    circle(404, 340, 18);                  //right
    triangle(377, 349, 396, 348, 394, 355); //nose

    noStroke();
    fill(brown);
    circle(375, 345, 18);                  //left eye
    circle(401, 346, 21);                  //right

    stroke(4);
    fill(yellow);
    circle(359, 313, 17);                  //inner ear left
    circle(415, 311, 19);                  //right
    ellipse(387, 347, 36, 16);             //mouth

    fill(black);
    triangle(376, 349, 396, 348, 394, 355); //nose

    fill(pink);
    ellipse(365, 342, 7, 4);               //left blush
    ellipse(413, 342, 10, 4);              //right

    fill(#A27E34);
    rect(355, 438, 20, 40);
    rect(380, 433, 20, 48);
    fill(#F5CDDE);
    ellipse(376, 368, 58, 42);
    fill(#5190E0);
    rect(354, 387, 48, 62, 5, 5, 4, 4);
    fill(#E0D551);
    ellipse(371, 379, 61, 47);
    ellipse(367, 385, 41, 29);

    fill(brown);
    ellipse(347, 374, 31, 38);             //left arm

    pushMatrix();
    translate(400, 400);
    rotate(radians(-11));
    ellipse(28, -27, 79, 35);              //right arm
    popMatrix();
    popMatrix();
  }
}
