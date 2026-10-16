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

  void bearIntrusion(Teddy bear, Plot plot) {
    bears.remove(bear);
    plot.removePlant();

    health--;
  }

  void spawnBears(int frameCount) {
    if (frameCount % 180 == 0) {
      spawnBear();
    }

    for (int i = bears.size() - 1; i >= 0; i--) {
      Teddy bear = bears.get(i);
      bear.display();
      bear.move(this);
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

void displayDefenses() {
    float t = 8;

    pushStyle();
    rectMode(CORNER);
    stroke(0);
    fill(110, 110, 130);

    for (Plot plot : plots) {
      if (!hasPlot(plot.x, plot.y - plot.height)) {
        rect(plot.x - t, plot.y - t, plot.width + 2*t, t);
      }
      if (!hasPlot(plot.x, plot.y + plot.height)) {
        rect(plot.x - t, plot.y + plot.height, plot.width + 2*t, t);
      }
      if (!hasPlot(plot.x - plot.width, plot.y)) {
        rect(plot.x - t, plot.y, t, plot.height);
      }
      if (!hasPlot(plot.x + plot.width, plot.y)) {
        rect(plot.x + plot.width, plot.y, t, plot.height);
      }
    }

    popStyle();
  }

  boolean hasPlot(float px, float py) {
    for (Plot other : plots) {
      if (abs(other.x - px) < 1 && abs(other.y - py) < 1) return true;
    }
    return false;
  }
}