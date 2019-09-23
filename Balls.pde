class Balls {
  float x = random(50, width-50);
  float y = 1;
  float gravity = 0.1;
  
  float dist;
  float selectBall = 50;
  
  void gravity() {
    y += y * gravity * df;
  }
  
  void update() {
    if(bigPlayer == true) {
      dist = width / 5.3;
    } else {
      dist = width / 6.8;
    }
    
    if (y >= playerY) {
      float d = dist(playerX, playerX, playerX, x);
      if(d <= dist) {
        if(point == 10) {
          gravity = 0.13;
        } else if (point == 30) {
          gravity = 0.15;
        } else if (point == 60) {
          gravity = 0.16;
        } else if (point == 100) {
          gravity = 0.17;
        }
        
        point ++;
          
        if(selectBall <= 2) {
          life ++;
          sound.stopAll();
          sound.stopLifesound();
          sound.stopSpecial();
          lifesound.amp(0.4);
          lifesound.cue(0.0);
          lifesound.play();
        } else if(selectBall >= 96 && bigPlayer == false) {
          bigPlayer = true;
          sound.stopAll();
          sound.stopSpecial();
          sound.stopLifesound();
          special.amp(0.1);
          special.cue(0.0);
          special.play();
        } else if(selectBall > 96 && bigPlayer == true) {
          sound.stopAll();
          hit.cue(0.0);
          hit.play();
        } else if(selectBall < 96 && selectBall > 2) {
          sound.stopAll();
          bg.amp(0.4);
          hit.cue(0.0);
          hit.play();
        }
        
        selectBall = random(0, 100);
        x = random(50, width-50);
        y = random(0, 40);
      }
    }
    if(y >= height && life > 1) {
      life --;
      bigPlayer = false;
      selectBall = random(0, 100);
        
      x = random(50, width-50);
      y = random(0, 40);
    } else if(y >= height) {
      sound.stopAll();
        
      if(highScore == true) {
        highup.amp(1.0);
        highup.cue(0.0);
        highup.play();
        backgroundMode = "highscore";
        background.change();
      } else {
        die.amp(1.0);
        die.cue(0.0);
        die.play();
        backgroundMode = "death";
        background.change();
      }
      sceneSelect = "death";
        
      selectBall = 50;
      life = 1;
      bigPlayer = false;
      
      gravity = 0.1;
      y = 1;
      x = random(50, width-50);
    }
  }
  
  void show() {
    if(selectBall <= 2) {
      fill(0, 225, 0);
      ellipse(x, y, width / 19.636363636, width / 19.636363636);
      fill(225, 225, 225);
    } else if(selectBall >= 96 && bigPlayer == false) {
      fill(200, 13, 13);
      ellipse(x, y, width / 19.636363636, width / 19.636363636);
      fill(225, 225, 225);
    } else {
      ellipse(x, y, width / 19.636363636, width / 19.636363636);
    }
  }
}
