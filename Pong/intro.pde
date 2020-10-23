void intro() {
  if (!intro.isPlaying()) {
    intro.rewind();
    intro.play();
  }

  textFont(zombie);
  background(48, 25, 52);
  stroke(21, 244, 238);

  //BACKGROUND DESIGN
  fill(21, 244, 238);
  rect(0, 100, 800, 50);

  stroke(74, 50, 100);
  fill(74, 50, 100);
  rect (100, 0, 50, 800);

  rect(100, 500, 800, 50);

  stroke(21, 244, 238);

  fill(21, 244, 238);
  rect(700, 100, 50, 800);

  //NEON
  textSize(50);
  text("Neon", 300, 300);

  //PONG
  fill(74, 50, 100);
  text("Pong", 410, 300);

  //TACTILE BUTTONS
  fill(0, 0, 109);
  rectButton(100, 350, 200, 100);
  rectButton(500, 350, 200, 100);

  fill(255, 192, 203);
  textSize(30);
  text("1 PLAYER", 150, 410);
  text("2 PLAYER", 550, 410);
}

void introClicks() {
  if (mouseX > 500 && mouseX < 700 && mouseY > 350 && mouseY < 450) {
    mode = GAME;
    upkey=true;
    downkey=true;
    AI=false;
  }

  if (mouseX > 100 && mouseX < 300 && mouseY > 350 && mouseY < 450) {
    mode = GAME;
    upkey=false;
    downkey=false;
    AI=true;
  }
}
