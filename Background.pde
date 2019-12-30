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
  float bgr, bgg, bgb;
  float bs = 1.25;
  
  void change() {
    bgr = 2;
    bgg = 2;
    bgb = 2;
  }
  
  void update() {
    if(scene.select == "WELCOME") {
      if (bgr < 50) {
        bgr = bgr*bs;
        bgr ++;
      }
      
      if (bgg < 50) {
        bgg = bgg*bs;
        bgg ++;
      }
      
      if (bgb < 60) {
        bgb = bgb*bs;
        bgb ++;
      }    
    } else if(scene.select == "GAME") {
      sky.show();
      if (bgr < 30) {
        bgr = bgr*bs;
        bgr ++;
      }
      
      if (bgg < 30) {
        bgg = bgg*bs;
        bgg ++;
      }
      
      if (bgb < 30) {
        bgb = bgb*bs;
        bgb ++;
      }
    } else if(scene.select == "DEATH") {
      if (bgr < 80) {
        bgr = bgr*bs;
        bgr ++;
      }
      
      if (bgg < 30) {
        bgg = bgg*bs;
        bgg ++;
      }
      
      if (bgb < 30) {
        bgb = bgb*bs;
        bgb ++;
      }
    } else if(scene.select == "HIGHSCORE") {
      if (bgr < 50) {
        bgr = bgr*bs;
        bgr ++;
      }
      
      if (bgg < 90) {
        bgg = bgg*bs;
        bgg ++;
      }
      
      if (bgb < 40) {
        bgb = bgb*bs;
        bgb ++;
      }
    }
  }
}
