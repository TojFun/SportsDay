Plot [][] plots = new Plot[12][8];

void setup() {
  size(960, 540);
  initialize();
}

void draw() {
  rect(200, 200, 40, 40) ;
}

void initialize() {
  float theWidth = width / plots.length;
  float theHeight = height/plots[0].length;
  int margin = 2;

  for (int i = 0; i < plots.length; i++) {
    for (int j = 0; j < plots[i].length; j++) {
      boolean canBeBought = !(i < margin || j < margin || plots.length - i - 1...||plots)
        plots[i][j] = new Plot(i, j, theWidth, theHeight, canBeBought);
    }
  }
}
