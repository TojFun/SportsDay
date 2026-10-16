class Farm {
  float x, y ;

  int defenses = 0, hearts = 0, health = 100;

  ArrayList<Plot> plots;
  ArrayList<Teddy> bears = new ArrayList<Teddy>();

  Farm(int xInit, int yInit) {
    x = xInit;
    y = yInit;

    plots = new ArrayList<Plot>();
  }

  void addPlotToFarm(Plot plot) {
    plot.makeFarm();
    plots.add(plot);
  }

  void buyDefense() {
  }

  void buyPlot(Plot plot) {
  }

  void buyPlant(Plant plat, Plot plot) {
  }

  void update() {
  }

  void spawnBears(int frameCount) {
    if (frameCount % 180 == 0) {
      spawnBear();
    }

    for (Teddy bear : bears) {
      bear.display();
      bear.move();
    }
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
}
