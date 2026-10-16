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
}
