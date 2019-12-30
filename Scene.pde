class Scene {
  String select = "WELCOME";
  void update() {
    if(select == "WELCOME") {
      menu.welcome(); 
    } else if(select == "DEATH" || select == "HIGHSCORE") {
      menu.death();
    } else if(select == "GAME") {
      menu.game();
      score.update();
      balls.update();
      balls.show();
      player.show();
    }
  }
}
