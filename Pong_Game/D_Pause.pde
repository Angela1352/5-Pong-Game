void pause() {
  theme.pause();

  strokeWeight(4);
  fill(pink);
  tactile(700, 40, 60, 60);
  rect(700, 40, 60, 60);
  textSize(40);
  stroke(255);
  strokeWeight(6);
  triangle(715, 54, 715, 86, 745, 70);

  textFont(font1);
  textSize(150);
  fill(0);
  text("paused", 403, 290);
  fill(lightMagenta);
  text("paused", 397, 290);
}

void pauseClicks() {
  if (mouseX > 700 && mouseX < 760 && mouseY > 40 && mouseY < 100) {
    mode = GAME;
    theme.play();
    bounce.rewind();
    bounce.play();
  }
}
