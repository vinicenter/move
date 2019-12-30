class Menu {
  void welcome() {
    textAlign(CENTER);
    textSize(width / 6.5);
    text("M O V E", width/2 , height - height + height / 4);
    
    textSize(width / 10.8);
    text("TAP TO CONTINUE", width/2 , height/2+100);
    
    textSize(width / 10.8);
    text("HIGH SCORE: " + score.highPoint, width/2 , height/2+220);
    
    textFont(fontDefault);
    textSize(width / 22);
    text("a game by viniciuseb", width/2 , height-100);
    textFont(font);
    if (touchStarted) {
      player.x = mouseX;
      scene.select = "GAME";
      bg.change();
      
      if(conti.isPlaying()) conti.stop();
      
      start.amp(0.1);
      start.cue(0.0);
      start.play();
    }
  }
  
  void game() {
    textAlign(LEFT);
    textSize(width / 13);
    text("SCORE: " + score.point, 50 , height/9.3);
    text("HIGH SCORE: " + score.highPoint, 50 , height/9.3+90);
    fill(0, 190, 0);
    text("LIFE: " + player.life, 50 , height/9.3+180);
    
    textAlign(CENTER);
    if(player.planetSelect == "EARTH") {
      textSize(width / 20);
      fill(225, 225, 225);
      text("RUN FROM THE METEORS", width/2 , height/9.3+500);
      textSize(width / 13);
      fill(93, 144, 61);
    } else if(player.planetSelect == "MARS") {
      fill(169, 85, 58);
    } else if(player.planetSelect == "NEPTUNE") {
      fill(58, 110, 169);
    } else if(player.planetSelect == "MERCURY") {
      fill(150, 158, 166);
    } else if(player.planetSelect == "JUPITER") {
      fill(211, 160, 87);
    }
    text(player.planetSelect, width/2, height/9.3+400);
  }
  
  void death() {
    textAlign(CENTER);
    if(score.highScore) {
      textSize(width / 10.0);
      text("NEW HIGH SCORE!", width/2 , height - height + height / 4);
    } else {
      textSize(width / 6.4);
      text("YOU DIED :(", width/2 , height - height + height / 4);
    }
    
    textSize(width / 10.0);
    text("SCORE: " + score.point, width/2 , height/2+100);
    
    textSize(width / 10.0);
    text("HIGH SCORE: " + score.highPoint, width/2 , height/2+200);
    
    textFont(fontDefault);
    textSize(width / 20);
    text("tap to continue", width/2 , height-100);
    textFont(font);
    if (touchStarted) {
      score.reset();
      bg.change();
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
