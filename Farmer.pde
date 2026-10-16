class Farmer {
  float targetX, targetY;
  float x, y;
  float angle;
  float speed = 2;
  float leg1 = 10;
  float leg2 = 10;
  float walkTimer = 0;
  boolean isWalking;



  // Constructor
  Farmer(float InitX, float InitY) {
    x = InitX;
    y = InitY;
  }

  void hugBear() {
    // Set the target position to the mouse position when a bear is targeted
    targetX = mouseX;
    targetY = mouseY;
  }

  void update() {
    // update leg positions based on walking state
    if (isWalking) {
      walkTimer += 0.1;   // higher = faster stepping
      leg1 = 20 + sin(walkTimer) * 15;   // between 15 and 45
      leg2 = 20 - sin(walkTimer) * 15;   // opposite of leg1
    } else {
      leg1 = 20;
      leg2 = 20;
    }
    // calculate the angle to the target position
    angle = atan2(targetY-y, targetX-x);
    if (dist(x, y, targetX, targetY) > speed) {
      x += cos(angle) * speed;
      y += sin(angle) * speed;
      isWalking =true;
    } else {
      isWalking =false;
    }
  }
  void display() {
    // draw the farmer at its current position and angle
    pushMatrix();
    pushStyle();

    stroke(126);
    strokeWeight(2);
    translate(x, y);
    rotate(HALF_PI);
    rectMode(CENTER);
    fill(#A27E34);
    rect(35, 7, leg1, 10);
    rect(35, -7, leg2, 10);

    fill(#5190E0);
    rect(15, 0, 40, 24, 5, 5, 4, 4);
    if (sin(angle) > 0) {
      fill(#F5CDDE);
      ellipse(-2, 0, 19, 16);
    }
    fill(#E0D551);
    ellipse(-10, 0, 23, 33);
    ellipse(-12, 0, 10, 14);

    popStyle();
    popMatrix();
  }
}
