class Carrot extends Plant {
  float cx, cy, s;
  int stage;
  int lastGrowTime = 0;

  Carrot(float cx, float cy, float s, int stage) {
    this.cx = cx;
    this.cy = cy;
    this.s = s;

    this.stage = stage;
  }
  void grow() { // timer flow 
    if (stage < 3 && millis() - lastGrowTime >= 10000) {
      stage++;
      lastGrowTime = millis();
    }
  }
  void display() {
    int stageOffset = stage == 1 ? 50: stage == 2 ? 30 :0;

    pushMatrix();
    pushStyle();
    noStroke();

    float leafY = cy + stageOffset*s;

    // orange part
    if (stage >1) {
      fill(250, 120, 20);
      if (stage == 2) {
        ellipse(cx, cy + 40*s, 20*s, 50*s);
      }
      if (stage == 3) {
        ellipse(cx, cy + 40*s, 50*s, 80*s);
      }
    }

    fill(20, 150 + 30*stage, 20);

    // left leaf
    pushMatrix();
    translate(cx - 10*s, leafY);
    rotate(-0.4);
    ellipse(0, 0, 20*s, 40*s);
    popMatrix();

    // middle leaf
    ellipse(cx, leafY, 20*s, 40*s);

    // right leaf
    pushMatrix();
    translate(cx + 10*s, leafY);
    rotate(0.4);
    ellipse(0, 0, 20*s, 40*s);
    popMatrix();

    popStyle();
    popMatrix();
  }
}
