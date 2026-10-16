Plot [][] plots;
Teddy bear;
Farm farm;
Farmer theFarmer;
HealthBar healthBar;


ArrayList<Teddy> bears = new ArrayList<Teddy>();

void setup() {
  size(960, 540);
  plots = generatePlots(width, height);

  bear = new Teddy(width/2, height/2, 1, 1);
  farm = new Farm(width /2, height/2);

  theFarmer = new Farmer(0, 0);
  healthBar = new HealthBar(10, 10, 200, 20);
}

void draw() {
  // rect(200, 200, 40, 40) ;

  for (Plot[] row : plots) {
    for (Plot plot : row) {
      plot.display();
    }
  }
  theFarmer.display();
  theFarmer.update();
  healthBar.display();


  if (frameCount % 180 == 0) {
    spawnBear();
  }

  for (Teddy bear : bears) {
    bear.display();
    bear.move();
  }

  theFarmer.display();
  theFarmer.update();
}

void mousePressed() {
  theFarmer.hugBear();
  theFarmer.isWalking = true;
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

void spawnBear() {
  float x = 0;
  float y = 0;
  float offset = 100;

  // Choose a random side of the screen
  int side = int(random(4));

  switch (side) {
  case 0: // Top
    x = random(width);
    y = -offset;
    break;

  case 1: // Right
    x = width + offset;
    y = random(height);
    break;

  case 2: // Bottom
    x = random(width);
    y = height + offset;
    break;

  case 3: // Left
    x = -offset;
    y = random(height);
    break;
  }

  // Random size, but not too small or large
  float bearSize = random(0.25, 0.75);

  Teddy bear = new Teddy(x, y, bearSize, 1);

  bears.add(bear);
}
