Plot [][] plots;
Teddy bear;
Farm farm;
Farmer farmer1;
HealthBar healthBar;

void setup() {
  size(960, 540);
  plots = generatePlots(width, height);
  bear = new Teddy(width/2, height/2, 1);
  farm = new Farm(width /2, height/2);
  farmer1 = new Farmer(0,0);
  healthBar = new HealthBar(10, 10, 200, 20);
}

void draw() {
  // rect(200, 200, 40, 40) ;

  for (Plot[] row : plots) {
    for (Plot plot : row) {
      plot.display();
    }
  }
  farmer1.display();
  farmer1.update();
  healthBar.display();
  
  // bear.display();
  // farm.display();
}

void mousePressed() {
  farmer1.hugBear();
  farmer1.isWalking = true;
}

Plot[][] generatePlots(float width, float height) {
  Plot [][] plots = new Plot[16][12];

  float theWidth = width / plots.length;
  float theHeight = height/plots[0].length;
  int margin = 2;
  int farmX = 2, farmY = 2;

  for (int i = 0; i < plots.length; i++) {
    for (int j = 0; j < plots[i].length; j++) {
      boolean canBeBought = !(
        i < margin ||
        j < margin ||
        i >= plots.length - margin ||
        j >= plots[i].length - margin
        );

      boolean isFarmPlot =
        i >= (plots.length - farmX) / 2 &&
        i < (plots.length + farmX) / 2 &&
        j >= (plots[i].length - farmY) / 2 &&
        j < (plots[i].length + farmY) / 2;

      plots[i][j] = new Plot(i, j, theWidth, theHeight, canBeBought, isFarmPlot);
    }
  }

  return plots;
}
