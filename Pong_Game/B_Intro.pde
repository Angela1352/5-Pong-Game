void intro () {
  image(space1, 400, 300, 900, 600);
  theme.play();

  fill(255);
  textFont(font1);
  textSize(110);
  text("SPACE PONG", 398, 200);
  fill(lavendar);
  textSize(110);
  text("SPACE PONG", 404, 198);

  //play button
  fill(lightPurple);
  strokeWeight(4);
  tactile(160, 370, 180, 90);
  rect(160, 370, 180, 90);

  tactile(460, 370, 180, 90);
  rect(460, 370, 180, 90);

  textSize(38);
  fill(255);
  text("Single-", 245, 394);
  text("player", 260, 426);
  text("Multi-", 540, 394);
  text("player", 560, 426);
}


void introClicks() {
  if (mouseX > 160 && mouseX < 340 && mouseY > 370 && mouseY < 460) {
    mode = GAME;
    AI = true;
    bounce.rewind();
    bounce.play();
  }

  if (mouseX > 460 && mouseX < 640 && mouseY > 370 && mouseY < 460) {
    mode = GAME;
    AI = false;
    bounce.rewind();
    bounce.play();
  }
}


void tactile(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    stroke(255);
  } else {
    stroke(darkPurple);
  }
}
