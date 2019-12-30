class Score {
  int point = 0;
  int highPoint  = loadScore("HIGHSCORE");
  boolean highScore = false;
  
  void reset() {
    score.highScore = false;
    score.point = 0;
    player.life = 1;
    scene.select = "WELCOME";
  }
  
  void show() {
    textAlign(LEFT);
    textSize(width / 13);
    text("SCORE: " + point, 50 , height/9.3);
    text("HIGH SCORE: " + highScore, 50 , height/9.3+90);
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
  
  void update() {
    if(point > highPoint) {
      highPoint = point;
      highScore = true;
      saveScore(point, "HIGHSCORE");
    }
  }
}

void saveScore(int value, String name){
  SharedPreferences sharedPreferences;
  SharedPreferences.Editor editor;
  Activity act;
  act = this.getActivity();
  sharedPreferences = PreferenceManager.getDefaultSharedPreferences(act.getApplicationContext());
  editor = sharedPreferences.edit();
  editor.putInt(name, value);
  editor.commit();
}
 
int loadScore(String name){
  SharedPreferences sharedPreferences;
  Activity act;
  act = this.getActivity();
  sharedPreferences = PreferenceManager.getDefaultSharedPreferences(act.getApplicationContext());
  int getScore = sharedPreferences.getInt(name, 0);
  return getScore;
}
