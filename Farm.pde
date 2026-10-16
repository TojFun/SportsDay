class Farm {
  float x, y ;

  int defenses = 0, hearts = 0;

  ArrayList<Plot> plots;

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
}
