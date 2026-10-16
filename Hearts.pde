class Hearts {
  float x, y;
  float width, height;
  int numHearts;

  Hearts(float x, float y, float width, float height, int numHearts) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.numHearts = numHearts;
  }

  void display() {
    pushMatrix();
    pushStyle();
    translate(x, y);
    scale(0.5);
    noStroke();
    fill(#E03A4E);

    beginShape();
    vertex(0, 0);                              // dip at the top middle
    bezierVertex(-40, -40, -80, 10, 0, 60);    // left side down to the bottom point
    bezierVertex(80, 10, 40, -40, 0, 0);       // right side back up to the top
    endShape(CLOSE);
    popStyle();
    popMatrix();

    textSize(20);
    fill(#151515);
    textFont(createFont("Arial", 30));
    text(numHearts, x + 40, y + 20);
  }
}
