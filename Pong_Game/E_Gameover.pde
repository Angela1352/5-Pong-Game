void gameover() {

  fill(babyPurple);
  rect(-10, -10, 420, 620);
  fill(peach);
  strokeWeight(0);
  rect(395, -10, 410, 620);
  image(space3, 460, 300, 940, 600);

  textSize(60);
  fill(255);
  textFont(font1);
  text("G A M E O V E R", 403, 220);
  fill(darkBlue);
  text("G A M E O V E R", 397, 220);

  if (leftscore > rightscore) {
    fill(babyPurple);
    textSize(60);
    text("-- PURPLE WINS --", 400, 330);
  } else if (leftscore < rightscore) {
    fill(peach);
    textSize(60);
    text("-- PINK WINS --", 400, 330);
  }

  fill(lightPurple);
  strokeWeight(4);
  tactile(310, 400, 180, 90);
  rect(310, 400, 180, 90);
  textSize(56);
  fill(255);
  text("HOME", 402, 435);
}


void gameoverClicks() {

  if (mouseX > 310 && mouseX < 490 && mouseY > 400 && mouseY < 490) {
    mode = INTRO;
    reset();
    bounce.rewind();
    bounce.play();
  }
}

void reset() {

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

  rightscore = leftscore = 0;
  timer = 100;

  theme.rewind();
}
