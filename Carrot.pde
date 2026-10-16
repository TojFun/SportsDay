class Carrot extends Plant {
  float cx, cy, s;

  Carrot(float cx, float cy, float s) {
    this.cx = cx;
    this.cy = cy;
    this.s = s;
  }

  void display() {
    pushMatrix();
    pushStyle();
    noStroke();

    // orange part
    fill(250, 120, 20);
    ellipse(cx, cy + 40*s, 50*s, 80*s);

    fill(20, 240, 20);

    // left leaf
    pushMatrix();
    translate(cx - 10*s, cy);
    rotate(-0.4);
    ellipse(0, 0, 20*s, 40*s);
    popMatrix();

    // middle leaf
    ellipse(cx, cy, 20*s, 40*s);

    // right leaf
    pushMatrix();
    translate(cx + 10*s, cy);
    rotate(0.4);
    ellipse(0, 0, 20*s, 40*s);
    popMatrix();

    popStyle();
    popMatrix();
  }
}
