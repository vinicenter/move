class Star {
  PVector p;
  
  Star(PVector p) {
    this.p = p;
  }
  
  void show() {
    fill(255);
    noStroke();
    ellipse(p.x, p.y, 2, 2);
  }
}

class Sky {
  Star[] stars = new Star[500];
  
  Sky() {
    for(int i = 0; i < stars.length; i ++) {
      Star star = new Star(new PVector(random(width), random(height)));
      stars[i] = star;
    }
  }
  
  void show() {
    for(Star star : stars) star.show();
  }
}

class Background {
  float backgroundSpeed = 1.25;
  
  void change() {
    backgroundR = 2;
    backgroundG = 2;
    backgroundB = 2;
  }
  
  void update() {
    if(backgroundMode == "welcome") {
      if (backgroundR < 65) {
        backgroundR = backgroundR*backgroundSpeed;
        backgroundR ++;
      }
      
      if (backgroundG < 48) {
        backgroundG = backgroundG*backgroundSpeed;
        backgroundG ++;
      }
      
      if (backgroundB < 129) {
        backgroundB = backgroundB*backgroundSpeed;
        backgroundB ++;
      }    
    } else if(backgroundMode == "game") {
      sky.show();
      if (backgroundR < 31) {
        backgroundR = backgroundR*backgroundSpeed;
        backgroundR ++;
      }
      
      if (backgroundG < 45) {
        backgroundG = backgroundG*backgroundSpeed;
        backgroundG ++;
      }
      
      if (backgroundB < 72) {
        backgroundB = backgroundB*backgroundSpeed;
        backgroundB ++;
      }
    } else if(backgroundMode == "death") {
      if (backgroundR < 91) {
        backgroundR = backgroundR*backgroundSpeed;
        backgroundR ++;
      }
      
      if (backgroundG < 13) {
        backgroundG = backgroundG*backgroundSpeed;
        backgroundG ++;
      }
      
      if (backgroundB < 13) {
        backgroundB = backgroundB*backgroundSpeed;
        backgroundB ++;
      }
    } else if(backgroundMode == "highscore") {
      if (backgroundR < 8) {
        backgroundR = backgroundR*backgroundSpeed;
        backgroundR ++;
      }
      
      if (backgroundG < 80) {
        backgroundG = backgroundG*backgroundSpeed;
        backgroundG ++;
      }
      
      if (backgroundB < 10) {
        backgroundB = backgroundB*backgroundSpeed;
        backgroundB ++;
      }
    }
  }
}
