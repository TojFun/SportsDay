Plot [][] plots;
Teddy bear;

void setup() {
  size(960, 540);
  plots = generatePlots(width, height);
  bear = new Teddy(width/2, height/2, 1);
}

void draw() {
  // rect(200, 200, 40, 40) ;

  for (Plot[] row : plots) {
    for (Plot plot : row) {
      plot.display();
    }
  }

  bear.display();
}

Plot[][] generatePlots(float width, float height) {
  Plot [][] plots = new Plot[16][9];

  float theWidth = width / plots.length;
  float theHeight = height/plots[0].length;
  int margin = 2;

  for (int i = 0; i < plots.length; i++) {
    for (int j = 0; j < plots[i].length; j++) {
      boolean canBeBought = !(
        i < margin ||
        j < margin ||
        i >= plots.length - margin ||
        j >= plots[i].length - margin
        );

      plots[i][j] = new Plot(i, j, theWidth, theHeight, canBeBought);
    }
  }

  return plots;
}
