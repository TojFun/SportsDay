class HealthBar {
  float x, y;
  float width, height;
  float health;

  HealthBar(float x, float y, float width, float height) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.health = 100; // Initial health value
  }

  void display(int health) {
    this.health = health;

    fill(255, 0, 0); // Red color for health bar
    rect(x, y, width * (health / 100), height); // Draw health bar based on current health
    noFill();
    rect(x, y, width, height); // Draw border of the health bar
  }

  void updateHealth(float newHealth) {
    health = constrain(newHealth, 0, 100); // Ensure health stays within bounds
  }
}
