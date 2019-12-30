import processing.opengl.*;
import processing.sound.*;
import android.content.Context;
import android.app.Activity;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;

SoundFile die, hit, lifesound, start, highup, bgmhs, bgm, conti;
PImage earth1, earth2, mars1, mars2, neptune1, neptune2, mercury1, mercury2, jupiter1, jupiter2, meteor, meteorRed, meteorGreen;
PFont font, fontDefault;

Player player;
Balls balls;
Fire fire;
Score score;
Menu menu;
Sky sky;
Background bg;
Scene scene;
Sound sound;

long lastLoopTime;
final int targeFPS = 60;
final long optimalTime = 1000000000 / targeFPS;
double df;

boolean touchStarted = false;

void setup() {
  orientation(PORTRAIT);
  fullScreen();
  frameRate(60);
  background(0);
  
  font = createFont("fonts/Behtix.ttf", 32);
  fontDefault = createFont("SansSerif", 32);
    
  meteor = loadImage("meteor.png");
  meteorGreen = loadImage("meteor-green.png");
  meteorRed = loadImage("meteor-red.png");
  earth1 = loadImage("earth1.png");
  earth2 = loadImage("earth2.png");
  mars1 = loadImage("mars1.png");
  mars2 = loadImage("mars2.png");
  neptune1 = loadImage("neptune1.png");
  neptune2 = loadImage("neptune2.png");
  mercury1 = loadImage("mercury1.png");
  mercury2 = loadImage("mercury2.png");
  jupiter1 = loadImage("jupiter1.png");
  jupiter2 = loadImage("jupiter2.png");
  
  die = new SoundFile(this, "songs/die.wav");
  lifesound = new SoundFile(this, "songs/life.wav");
  start = new SoundFile(this, "songs/start.wav");
  hit = new SoundFile(this, "songs/hit.wav");
  conti = new SoundFile(this, "songs/continue.wav");
  highup = new SoundFile(this, "songs/highup.wav");
  bgm = new SoundFile(this, "songs/m2.wav");
  
  scene = new Scene();
  player =  new Player();
  balls =  new Balls();
  fire = new Fire();
  score = new Score();
  menu = new Menu();
  sky = new Sky();
  bg = new Background();
  sound = new Sound();
  
  lastLoopTime = System.nanoTime();
}

void draw() {
  long now = System.nanoTime();
  long updateTime = now - lastLoopTime;
  lastLoopTime = now;
  df = updateTime / (double) optimalTime;
  
  background(bg.bgr, bg.bgg, bg.bgb);
  bg.update();
  
  scene.update();
  
  if(!bgm.isPlaying()) bgm.loop();
  touchStarted = false;
}

void touchStarted() {
  touchStarted = true;
}

void onStop() {
  sound.stopAll();
  sound.stopBg();
  sound.stopStart();
  sound.stopLifesound();
}
