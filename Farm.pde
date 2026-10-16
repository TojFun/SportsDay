class Farm { // This is the main class of the game, where all variables are.
  float x, y ;

  int defenses = 0, hearts = 0, health = 16;

  ArrayList<Plot> plots;
  ArrayList<Teddy> bears = new ArrayList<Teddy>();
  FloatDict wallHealth = new FloatDict();
  float wallThickness = 8;

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
    if (hearts >= 15 && defenses == 0) {
      hearts -= 15;
      defenses = 1;
      wallHealth.clear();
    }
  }

  /* Did not have enough time to implement buying plots and planting.
   There are a few remanents of those ideas throughout the program. */

  void buyPlot(Plot plot) {
  }

  void buyPlant(Plant plat, Plot plot) {
  }

  void bearIntrusion(Teddy bear, Plot plot) {
    bears.remove(bear);
    plot.removePlant();

    health--;
  }

  boolean isHugging() {
    for (Teddy bear : bears) {
      if (bear.hugging) {
        return true;
      }
    }
    return false;
  }

  void spawnBears(int frameCount, Farmer farmer) {
    if (frameCount % 180 == 0) {
      spawnBear();
    }

    for (int i = bears.size() - 1; i >= 0; i--) {
      Teddy bear = bears.get(i);

      if (bear.leaving || !attackWall(bear)) {
        bear.move(this, farmer);
      }
      if (!bears.contains(bear)) {
        continue;
      }

      bear.display();

      // Remove bear once it has left the screen
      if (bear.leaving &&
        (bear.x < -120 || bear.x > width + 120 ||
        bear.y < -120 || bear.y > height + 120)) {

        bears.remove(i);
      }
    }
  }

  void spawnBear() {
    float x = 0;
    float y = 0;
    float offset = 100;

    // Choose a random side of the screen
    int side = round(random(4));

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
    if (defenses == 0) return;

    pushStyle();
    rectMode(CORNER);
    stroke(0);

    for (Plot plot : plots) {
      for (int side = 0; side < 4; side++) {
        if (!sideIsOpen(plot, side)) continue;
        if (getWallHealth(wallKey(plot, side)) <= 0) continue;

        float[] w = wallRect(plot, side);
        fill(lerpColor(color(30, 30, 40), color(110, 110, 130), getWallHealth(wallKey(plot, side)) / 100));
        rect(w[0], w[1], w[2], w[3]);
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

  boolean sideIsOpen(Plot plot, int side) {
    if (side == 0) return !hasPlot(plot.x, plot.y - plot.height);
    if (side == 1) return !hasPlot(plot.x, plot.y + plot.height);
    if (side == 2) return !hasPlot(plot.x - plot.width, plot.y);
    return !hasPlot(plot.x + plot.width, plot.y);
  }

  float[] wallRect(Plot plot, int side) {
    float t = wallThickness;
    if (side == 0) return new float[] {plot.x - t, plot.y - t, plot.width + 2*t, t};
    if (side == 1) return new float[] {plot.x - t, plot.y + plot.height, plot.width + 2*t, t};
    if (side == 2) return new float[] {plot.x - t, plot.y, t, plot.height};
    return new float[] {plot.x + plot.width, plot.y, t, plot.height};
  }

  String wallKey(Plot plot, int side) {
    return int(plot.x) + "," + int(plot.y) + "," + side;
  }

  float getWallHealth(String key) {
    if (!wallHealth.hasKey(key)) wallHealth.set(key, 100);
    return wallHealth.get(key);
  }

  boolean attackWall(Teddy bear) {
    if (defenses == 0) return false;

    float r = 60 * bear.scale;

    for (Plot plot : plots) {
      for (int side = 0; side < 4; side++) {
        if (!sideIsOpen(plot, side)) continue;

        String key = wallKey(plot, side);
        if (getWallHealth(key) <= 0) continue;

        float[] w = wallRect(plot, side);
        if (bear.x > w[0] - r && bear.x < w[0] + w[2] + r && bear.y > w[1] - r && bear.y < w[1] + w[3] + r) {
          wallHealth.sub(key, 0.5);

          if (getWallHealth(key) <= 0) {
            boolean wallsLeft = false;

            for (Plot p : plots) {
              for (int s = 0; s < 4; s++) {
                if (sideIsOpen(p, s) && getWallHealth(wallKey(p, s)) > 0) {
                  wallsLeft = true;
                }
              }
            }

            if (!wallsLeft) {
              defenses = 0;
            }
          }

          return true;
        }
      }
    }
    return false;
  }
}
