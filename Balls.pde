class Balls {
  float x = random(50, width-50);
  float y = 1;
  float g = 0.1;
  float selectBall = 50;
  
  void gravity() {
    y += y * g * df;
  }
  
  void update() {
    gravity();
    if (y >= player.y) if(isHitted(player.x, x, width / 6)) hit(); 
    nothit();
  }
  
  boolean isHitted(float ax, float bx, float s) {
    return dist(ax, ax, ax, bx) < s;
  }
  
  void hit() {
    if(score.point == 10) {
      g = 0.12;
      player.planetSelect = "NEPTUNE";
    } else if (score.point == 30) {
      g = 0.14;
      player.planetSelect = "MERCURY";
    } else if (score.point == 60) {
      g = 0.15;
      player.planetSelect = "JUPITER";
    } else if (score.point == 100) player.planetSelect = "EARTH";
          
    if(selectBall <= 2) {
      //if hitted and meteor is green(life)
      score.point ++;
      player.life ++;
      sound.stopAll();
      sound.stopLifesound();
      lifesound.amp(0.4);
      lifesound.cue(0.0);
      lifesound.play();
      selectBall = random(0, 100);
      x = random(50, width-50);
      y = random(1, 40);
    } else if(selectBall >= 96) {
      //if hitted and meteor is red
      sound.stopAll();
      hit.amp(0.4);
      hit.cue(0.0);
      hit.play();
      if(player.life > 1) {
        //if hitted and meteor is red and life is > 1
        player.life --;
        score.point = score.point-10;
        if(player.planetSelect == "EARTH") {
          selectBall = 100;
        } else {
          selectBall = random(0, 100);
        }
        
        x = random(50, width-50);
        y = random(1, 40);
      } else {
        //if hitted and meteor is red and life is < 1
        lose();
      }
    } else if(selectBall < 96 && selectBall > 2) {
      //if hitted and meteor is gray(normal)
      score.point ++;
      sound.stopAll();
      hit.amp(0.4);
      hit.cue(0.0);
      hit.play();
      if(player.planetSelect == "EARTH") {
        selectBall = 100;
      } else {
        selectBall = random(0, 100);
      }
      x = random(50, width-50);
      y = random(1, 40);
    }
  }
  
  void nothit() {
    if(y >= height && selectBall >= 96) {
      //if not hitted and meteor is red
      if(player.planetSelect == "EARTH") {
        sound.stopAll();
        hit.amp(0.4);
        hit.cue(0.0);
        hit.play();
        selectBall = 100;
      } else {
        selectBall = random(0, 100);
      }
      score.point ++;
        
      x = random(50, width-50);
      y = random(1, 40);
    } else if(y >= height && player.life > 1) {
      //if not hitted and life is > 1
      player.life --;
      selectBall = random(0, 100);
        
      x = random(50, width-50);
      y = random(1, 40);
    } else if(y >= height) {
      //if not hitted and life is < 1
      lose();
    }
  }
  
  void lose() {
    sound.stopAll();
    if(score.highScore == true) {
      highup.amp(1.0);
      highup.cue(0.0);
      highup.play();
      scene.select = "HIGHSCORE";
    } else {
      die.amp(1.0);
      die.cue(0.0);
      die.play();
      scene.select = "DEATH";
    }
    bg.change();
    player.planetSelect = "MARS";
        
    selectBall = 50;
    player.life = 1;
      
    g = 0.1;
    y = 1;
    x = random(50, width-50);
  }
  
  void show() {
    if(selectBall <= 2) {
      for(int i=0; i<4; i++) fire.create();
      fire.show(); 
      fill(0, 225, 0);
      image(meteorGreen, x, y, width / 14, width / 14);
      fill(225, 225, 225);
    } else if(selectBall >= 96) {
      for(int i=0; i<4; i++) fire.create();
      fire.show(); 
      fill(200, 13, 13);
      image(meteorRed, x, y, width / 14, width / 14);
      fill(225, 225, 225);
    } else {
      for(int i=0; i<4; i++) fire.create();
      fire.show(); 
      image(meteor, x, y, width / 14, width / 14);
    }
  }
}
