class Plot {
  float x, y, width, height;
  boolean canBeBought;
  boolean isFarmPlot;

  Plant[][] plants = new Plant[2][2];

  final color DARK_BROWN = color(120, 80, 30);

  color background;

  Plot(float x, float y, float width, float height, boolean canBeBought) {
    this.x = x * width;
    this.y = y * height;

    this.width = width;
    this.height = height;

    this.canBeBought = canBeBought;
    background = color(random(75, 90), random(125, 145), random(45, 60));


    initCarrots();
  }

  void makeFarm() {
    isFarmPlot = true;
    background = DARK_BROWN;
  }

  void display() {
    pushMatrix();
    pushStyle();

    fill(background);
    rect(x, y, width, height);

    if (isFarmPlot) {
      fill(DIRT_BROWN);
      noStroke();
      rect(x + width/18, y + width/18, width * 0.9, height * 0.9, 10);

      for (Plant[] row : plants) {
        for (Plant plant : row) {
          if (plant == null ) continue;

          plant.display();
          plant.grow();
        }
      };
    }

    popStyle();
    popMatrix();
  }

  void initCarrots() {
    float centerX = x + width/2, centerY = y + height/2.5;

    plants[0][0] = new Carrot(centerX - width / 5, centerY - height / 4, 0.25, 1);
    plants[0][1] = new Carrot(centerX + width / 5, centerY - height / 4, 0.25, 1);
    plants[1][0] = new Carrot(centerX - width / 5, centerY + height / 4, 0.25, 1);
    plants[1][1] = new Carrot(centerX + width / 5, centerY + height / 4, 0.25, 1);
  }

  void removePlant() {
    boolean shouldBreak = false;
    for (int i = 0; !shouldBreak && i < plants.length; i++) {
      for (int j = 0; j < plants[i].length; j++) {
        if (plants[i][j] != null) {
          plants[i][j] = null;
          shouldBreak = true;
          break;
        }
      }
    }
  }

  void regrowPlants() {
    float centerX = x + width/2;
    float centerY = y + height/2.5;

    for (int i = 0; i < 2; i++) {
      for (int j = 0; j < 2; j++) {
        if (plants[i][j] == null && random(1) < 0.2) {
          float plantX = centerX + (j == 0 ? -width/5 : width/5);
          float plantY = centerY + (i == 0 ? -height/4 : height/4);

          plants[i][j] = new Carrot(plantX, plantY, 0.25, 1);
        }
      }
    }
  }
}
