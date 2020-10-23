import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer right,left,win,score,wall,intro;
int mode;
PFont zombie;

final int INTRO    = 1;
final int GAME     = 2;
final int PAUSE    = 3;
final int GAMEOVER = 4;
boolean AI;

//entity variables
float leftx, lefty, leftd,rightx,righty,rightd;
float ballx,bally,balld;

//keyboard variables
boolean wkey,skey,upkey,downkey;

//scoring
int leftscore, rightscore, timer;



void setup() {
  size(800, 600);
  mode = INTRO;
  
  leftx=0;
  lefty=height/2;
  leftd=200;
  
  rightx=width;
  righty=height/2;
  rightd=200;
  AI=true;
  
  //sound
  minim = new Minim(this);
  right=minim.loadFile("rightpaddle.wav");
  left=minim.loadFile("leftpaddle.wav");
  win=minim.loadFile("clapping.wav");
  score=minim.loadFile("score.wav");
  wall=minim.loadFile("wall.wav");
  intro=minim.loadFile("intro.wav");
  
  
  //balllllllllllllllll==========================================
  ballx= width/2;
  bally=height/2;
  balld=50;
  timer=100;
  vx=3;
  vy=4;
  zombie=createFont("zombie.ttf",200);
  
  //initialize keboard var
  wkey=skey=upkey=downkey=false;
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
     gameover();
  } else {
    println("Mode Error:" +mode);
  }
}

void rectButton (int x, int y, int w, int h) {
  if (mouseX> x && mouseX < x+w && mouseY>y && mouseY<y+w) {
    strokeWeight(5);
    stroke(255, 0, 0);
  } else {
    stroke(1);
    strokeWeight(1);
  }
  rect(x, y, w, h);
}
