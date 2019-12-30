class Player {
  float x, y;
  int life = 1;
  
  String planetSelect = "MARS";
  
  void touch() {
    if (mousePressed) {
      if(balls.isHitted(x, mouseX, width/ 3.0)) x = mouseX;
    }
  }
  
  void show() {
    touch();
    y = height-200;
    fill(255, 255, 255);
    if(planetSelect == "EARTH") {
      image(earth2, x, y, width / 5.8, width / 8.8);
      image(earth1, x, y, width / -5.8, width / 8.8);
    } else if(planetSelect == "MARS") {
      image(mars2, x, y, width / 5.8, width / 8.8);
      image(mars1, x, y, width / -5.8, width / 8.8);
    } else if(planetSelect == "NEPTUNE") {
      image(neptune2, x, y, width / 5.8, width / 8.8);
      image(neptune1, x, y, width / -5.8, width / 8.8);
    } else if(planetSelect == "MERCURY") {
      image(mercury2, x, y, width / 5.8, width / 8.8);
      image(mercury1, x, y, width / -5.8, width / 8.8);
    } else if(planetSelect == "JUPITER") {
      image(jupiter2, x, y, width / 5.8, width / 8.8);
      image(jupiter1, x, y, width / -5.8, width / 8.8);
    }
  }
}
