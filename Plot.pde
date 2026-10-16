class Plot {
  float x, y, width, height;
  boolean canBeBought;

  Plant[][] plants = new Plant[2][2];

  Plot(float x, float y, float width, float height, boolean canBeBought) {
    this.x = x * width;
    this.y = y * height;

    this.width = width;
    this.height = height;

    this.canBeBought = canBeBought;
  }
}
