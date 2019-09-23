class Scene {
  void update() {
    if(sceneSelect == "welcome") {
      menu.welcome(); 
    } else if(sceneSelect == "death") {
      menu.death();
    } else if(sceneSelect == "game") {
      score.update();
      score.show();
  
      balls.gravity();
      balls.update();
      balls.show();
    
      player.touch();
      player.show();
    }
  }
}
