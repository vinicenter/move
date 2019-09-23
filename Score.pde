class Score {
  void show() {
    textAlign(LEFT);
    textSize(width / 13);
    text("SCORE: " + point, 50 , height/9.3);
    text("HIGH SCORE: " + highPoint, 50 , height/9.3+90);
    fill(0, 225, 0);
    text("LIFE: " + life, 50 , height/9.3+180);
    fill(225, 225, 225);
  }
  
  void update() {
   if(point > highPoint) {
    highPoint = point;
    highScore = true;
    saveScore(point, "highscore");
   }
  }
}

void saveScore(int _score_, String name){
  SharedPreferences sharedPreferences;
  SharedPreferences.Editor editor;
  Activity act;
  act = this.getActivity();
  sharedPreferences = PreferenceManager.getDefaultSharedPreferences(act.getApplicationContext());
  editor = sharedPreferences.edit();
  editor.putInt(name, _score_);
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
