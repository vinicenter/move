class Sound {
  void stopAll() {
    if(die.isPlaying()) die.pause();
    if(highup.isPlaying()) highup.pause();
    if(conti.isPlaying()) conti.pause();
    if(hit.isPlaying()) hit.pause(); 
  }
  
  void stopLifesound() {
    if(lifesound.isPlaying()) lifesound.pause();
  }
  
  void stopStart() {
    if(start.isPlaying()) start.pause();
  }
  
  void stopBg() {
    if(bgm.isPlaying()) bgm.pause();
  }
}
