class Plot {
  float x, y, width, height;
  boolean canBeBought;
  boolean isFarmPlot;

  Plant[][] plants = new Plant[2][2];

  final color BROWN = color(140, 90, 40),
    DARKBROWN = color(120, 80, 30);

  Plot(float x, float y, float width, float height, boolean canBeBought, boolean isFarmPlot) {
    this.x = x * width;
    this.y = y * height;

    this.width = width;
    this.height = height;

    this.canBeBought = canBeBought;
    this.isFarmPlot = isFarmPlot;

    initCarrots();
  }

  void display() {
    fill(255%x, 255%y, 255);
    if (isFarmPlot) fill(DARKBROWN);
    rect(x, y, width, height);

    if (!isFarmPlot) return;

    fill(BROWN);
    noStroke();
    rect(x + width/18, y + width/18, width * 0.9, height * 0.9, 10);

    for (Plant[] row : plants) {
      for (Plant plant : row) {
        plant.display();
      }
    };
  }

  void initCarrots() {
    float centerX = x + width/2, centerY = y + height/2.5;

    plants[0][0] = new Carrot(centerX - width / 5, centerY - height / 4, 0.25);
    plants[0][1] = new Carrot(centerX + width / 5, centerY - height / 4, 0.25);
    plants[1][0] = new Carrot(centerX - width / 5, centerY + height / 4, 0.25);
    plants[1][1] = new Carrot(centerX + width / 5, centerY + height / 4, 0.25);
  }
}
