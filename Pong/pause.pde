void pause() {
  fill(255);
  textSize(120);
  text("PAUSE", 230, 350);

}


void pauseClicks() {
  if (dist(mouseX, mouseY, 0, 0) <800) {
    mode=GAME;
  }
}
