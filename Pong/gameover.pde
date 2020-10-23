void gameover() {
      if (!win.isPlaying()) {
   win.rewind();
    win.play();
  }
  background(0);
  if (leftscore>rightscore) {
    fill(21, 244, 238);
    textSize(120);
    text("LEFT WINS", 150, 300); 
    textSize(40);
    text("click to go back to intro", 200, 500);
  } else if (leftscore<rightscore) {
    fill(74, 50, 100);
    textSize(120);
    text("RIGHT WINS", 150, 300);
    textSize(40);
    text("click to go back to intro", 200, 500);
  }
}

void gameoverClicks() {
  if (mouseX > 0 && mouseX < 600 && mouseY > 0 && mouseY < 800) {
    mode = INTRO;
  }
}
