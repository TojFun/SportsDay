
final color DIRT_BROWN = color(140, 90, 40);

Plot [][] plots;
Teddy bear;
Farm farm;
Farmer theFarmer;
HealthBar healthBar;
Hearts hearthBar;

void setup() {
  size(960, 540);

  farm = new Farm(width /2, height/2);
  hearthBar = new Hearts(40, 50, 200, 20, 0);

  theFarmer = new Farmer(width/2, height/2);
  healthBar = new HealthBar(width/100, height/50, width/4, height/30);

  plots = generatePlots(width, height);
}

void draw() {
  // rect(200, 200, 40, 40) ;

  for (Plot[] row : plots) {
    for (Plot plot : row) {
      plot.display();
    }
  }

  farm.displayDefenses();

  healthBar.display(farm.health);

  if (!farm.isHugging()) {
    theFarmer.update();
  }

  farm.spawnBears(frameCount, theFarmer);

  if (!farm.isHugging()) {
    theFarmer.display();
  }

  hearthBar.display(farm.hearts);
}

void mousePressed() {
  if (!farm.isHugging()) {
    theFarmer.hugBear();
    theFarmer.isWalking = true;
  }
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

      Plot plot = new Plot(i, j, theWidth, theHeight, canBeBought);

      plots[i][j] = plot;

      if (isFarmPlot) farm.addPlotToFarm(plot);
    }
  }

  return plots;
}
