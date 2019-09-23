import processing.sound.*;
import android.content.Context;
import android.app.Activity;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;

SoundFile die, hit, lifesound, special, start, highup, bghs, bg, conti;

PFont font, fontArial;

float playerX, playerY;

int life = 1;
int point = 0;
int highPoint;
boolean highScore = false;
boolean bigPlayer = false;

String sceneSelect = "welcome";

String backgroundMode = "welcome";
float backgroundR = 65;
float backgroundG = 48;
float backgroundB = 129;

boolean touchStarted = false;

Player player;
Balls balls;
Score score;
Menu menu;
Sky sky;
Background background;
Scene scene;
Sound sound;

long lastLoopTime;
final int targeFPS = 60;
final long optimalTime = 1000000000 / targeFPS;
double df;

void setup() {
  orientation(PORTRAIT);
  size(displayWidth, displayHeight);
  frameRate(60);
  background(0);
  
  font = createFont("fonts/Behtix.ttf", 32);
  fontArial = createFont("SansSerif", 32);

  lastLoopTime = System.nanoTime();
  highPoint = loadScore("highscore");
  
  scene = new Scene();
  player =  new Player();
  balls =  new Balls();
  score = new Score();
  menu = new Menu();
  sky = new Sky();
  background = new Background();
  sound = new Sound();
  
  die = new SoundFile(this, "songs/die.wav");
  lifesound = new SoundFile(this, "songs/life.wav");
  start = new SoundFile(this, "songs/start.wav");
  hit = new SoundFile(this, "songs/hit.wav");
  special = new SoundFile(this, "songs/special.wav");
  conti = new SoundFile(this, "songs/continue.wav");
  highup = new SoundFile(this, "songs/highup.wav");
  bg = new SoundFile(this, "songs/m2.wav");
}

void draw() {
  long now = System.nanoTime();
  long updateTime = now - lastLoopTime;
  lastLoopTime = now;
  df = updateTime / (double) optimalTime;
  
  background(backgroundR, backgroundG, backgroundB);
  background.update();
 
  noStroke();
  fill(225, 225, 225);
  textFont(font);
  
  scene.update();
 
  touchStarted = false;
  
  if(bg.isPlaying()) { 
  } else {
    bg.amp(0.5);
    bg.loop();
  }
}

void touchStarted() {
  touchStarted = true;
}

void onStop() {
  sound.stopAll();
  sound.stopBg();
  sound.stopStart();
  sound.stopLifesound();
  sound.stopSpecial();
}
