import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// Angela Chen
// 2-3
// Apr 11, 2022


//mode framework
int mode;
final int INTRO     = 1;
final int GAME      = 2;
final int PAUSE     = 3;
final int GAMEOVER  = 4;


//entity variables
float leftx, lefty, leftd, rightx, righty, rightd; //paddles
float ballx, bally, balld; //ball
float vballx, vbally;


//keyboard variables
boolean wkey, skey, upkey, downkey;


//COLOR PALLETTE
color lightPurple    = #7F70AB; //done
color darkPurple     = #594779; //done
color lightMagenta   = #906086; //done
color darkMagenta    = #74476E; //done
color babyPurple     = #C3B4DB; //done
color lavendar       = #C28EBC; //done
color darkBlue       = #3F3965; //done
color pink           = #F09F9C; //done
color peach          = #FFC1A0; //done


//scoring
int leftscore, rightscore, timer;


//sound variables
Minim minim;
AudioPlayer theme, bounce, gameover, miss;


//other variables
float r, R;
PImage space1, space2, space3;
PFont font1, font2;
boolean AI;


void setup() {
  size(800, 600);
  mode = INTRO;

  //initialize paddles
  leftx = 0;
  lefty = height/2;
  leftd = 150;

  rightx = width;
  righty = height/2;
  rightd = 150;

  //initialize ball
  ballx = width/2;
  bally = height/2;
  balld = 100;

  vballx = random(-12, 12);
  vbally = random(-12, 12);

  //initialize keyboard
  wkey = skey = upkey = downkey = false;

  textAlign(CENTER, CENTER);
  imageMode(CENTER);


  r = leftd/2;
  R = balld/2;

  rightscore = leftscore = 0;
  timer = 100;

  space1 = loadImage("space1.jpg");
  space2 = loadImage("space2.png");
  space3 = loadImage("space3.jpg");

  font1  = createFont("font1.otf", 100);
  font2  = createFont("font2.ttf", 100);

  //minim
  minim    = new Minim(this);
  theme    = minim.loadFile("theme.mp3");
  miss     = minim.loadFile("miss.mp3");
  bounce   = minim.loadFile("bounce.mp3");
  gameover = minim.loadFile("gameover.mp3");
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
    println("Mode error: " + mode);
  }
}
