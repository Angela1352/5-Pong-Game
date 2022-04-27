void game() {
  fill(babyPurple);
  rect(-10, -10, 420, 620);
  fill(peach);
  strokeWeight(0);
  rect(395, -10, 410, 620);
  image(space2, 400, 300, 780, 580);

  fill(255);
  strokeWeight(15);
  line(398, 0, 398, 600);

  //draw paddles
  strokeWeight(4);
  stroke(255);
  fill(lightPurple);
  circle(leftx, lefty, leftd);
  fill(pink);
  circle(rightx, righty, rightd);

  //move paddles
  if (wkey == true) lefty = lefty - 5;
  if (skey == true) lefty = lefty + 5;

  if (AI == false) {
    if (upkey == true) righty = righty - 5;
    if (downkey == true) righty = righty + 5;
  } else {
    if (ballx > 400) {
      if (bally > righty) {
        righty = righty + 4;
      }
      if (bally < righty) {
        righty = righty - 4;
      }
    }
  }

  //ball: move, bounce
  fill(darkBlue);
  circle(ballx, bally, balld);

  if (timer < 0) {
    ballx = ballx + vballx;
    bally = bally + vbally;
  }

  if (bally <= balld/2 || bally >= height-balld/2) {
    vbally = vbally * -1;
  }

  if (dist(leftx, lefty, ballx, bally) < r + R) {
    vballx = (ballx - leftx)/15;
    vbally = (bally - lefty)/15;
    bounce.rewind();
    bounce.play();
  }

  if (dist(rightx, righty, ballx, bally) < r + R) {
    vballx = (ballx - rightx)/12;
    vbally = (bally - righty)/12;
    bounce.rewind();
    bounce.play();
  }

  //score board
  textFont(font2);
  textSize(50);
  fill(babyPurple);
  text(leftscore, width/4, 100);
  fill(peach);
  text(rightscore, 3*width/4, 100);
  //text(timer, 500, 500);
  timer = timer - 2;

  //scoring
  if (ballx < 45) {
    rightscore++;
    ballx = width/2;
    bally = height/2;
    timer = 60;
    miss.rewind();
    miss.play();
  }

  if (ballx > 755) {
    leftscore++;
    ballx = width/2;
    bally = height/2;
    timer = 60;
    miss.rewind();
    miss.play();
  }

  //paddle limits
  if (lefty <= 85 ) {
    lefty =  85;
  }

  if (lefty >= 515) {
    lefty = 515;
  }

  if (righty <= 85) {
    righty = 85;
  }

  if (righty >= 515) {
    righty = 515;
  }

  if (bally <= 20) {
    bally = 20;
  }

  if (bally >= 580) {
    bally = 580;
  }

  if (rightscore == 3 || leftscore == 3) {
    mode = GAMEOVER;
    theme.pause();
    gameover.rewind();
    gameover.play();
  }

  //pause button
  strokeWeight(4);
  fill(pink);
  tactile(700, 40, 60, 60);
  rect(700, 40, 60, 60);
  stroke(255);
  strokeWeight(8);
  line(720, 54, 720, 86);
  line(740, 54, 740, 86);
}



void gameClicks() {

  if (mouseX > 700 && mouseX < 760 && mouseY > 40 && mouseY < 100) {
    mode = PAUSE;
    bounce.rewind();
    bounce.play();
  }
}
