class Menu {
  void welcome() {
    textAlign(CENTER);
    textSize(width / 6.5);
    text("M O V E", width/2 , height - height + height / 4);
    
    textSize(width / 10.8);
    text("TAP TO CONTINUE", width/2 , height/2+100);
    
    textSize(width / 10.8);
    text("HIGH SCORE: " + highPoint, width/2 , height/2+220);
    
    textFont(fontArial);
    textSize(width / 22);
    text("a minimalist game by viniciuseb", width/2 , height-100);
    textFont(font);
    if (touchStarted == true) {
      backgroundMode = "game";
      background.change();
      touchStarted = false;
      playerX = mouseX;
      sceneSelect = "game";
      
      if(conti.isPlaying()) {
        conti.stop();
      }
      
      start.amp(0.1);
      start.cue(0.0);
      start.play();
    }
  }
  
  void death() {
    textAlign(CENTER);
    if(highScore == true) {
      textSize(width / 10.0);
      text("NEW HIGH SCORE!", width/2 , height - height + height / 4);
    } else {
      textSize(width / 6.4);
      text("YOU DIED :(", width/2 , height - height + height / 4);
    }
    
    textSize(width / 10.0);
    text("SCORE: " + point, width/2 , height/2+100);
    
    textSize(width / 10.0);
    text("HIGH SCORE: " + highPoint, width/2 , height/2+200);
    
    textSize(width / 20);
    text("tap to continue", width/2 , height-100);
    if (touchStarted == true) {
      backgroundMode = "welcome";
      background.change();
      highScore = false;
      touchStarted = false;
      point = 0;
      life = 1;
      sceneSelect = "welcome";
      if(die.isPlaying()) {
        die.stop();
      } else if(highup.isPlaying()) {
        highup.stop();
      }
      start.amp(0.4);
      conti.cue(0.0);
      conti.play();
    }
  }
}
