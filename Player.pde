class Player {
  void touch() {
    if (mousePressed) {
      float playerXpos = dist(playerX, playerX, mouseX, mouseX);
      if (playerXpos <= width / 3.0) {
        playerX = mouseX;
      }
    }
  }
  void show() {
    playerY = height-200;
    if (bigPlayer == true) {
      fill(200, 13, 13);
      rect(playerX, playerY, width / 7.2, width / 10.8, 0, 25, 25, 0);
      rect(playerX, playerY, width / -7.2, width / 10.8, 25, 0, 0, 25);
      fill(225, 225, 225);
    } else {
      fill(255, 255, 255);
      rect(playerX, playerY, width / 10.8, width / 10.8, 0, 25, 25, 0);
      rect(playerX, playerY, width / -10.8, width / 10.8, 25, 0, 0, 25);
    }
  }
}
