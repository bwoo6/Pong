float vx, vy;
//song
void game() {
  if (!intro.isPlaying()) {
    intro.rewind();
    intro.play();
  }

  background(0);

  //center line
  strokeWeight(5);
  stroke(255);
  line(width/2, 0, width/2, height);

  //scoreboard
  textSize(50);
  fill(21, 244, 238);
  text (leftscore, width/4, 100);
  fill(74, 50, 100);
  text(rightscore, 3*width/4, 100);
  timer=timer-1;


  //paddles
  strokeWeight(0);
  stroke(21, 244, 238);
  fill(21, 244, 238);
  circle(leftx, lefty, leftd);
  fill(74, 50, 100);
  stroke(74, 50, 100);
  circle(rightx, righty, rightd);

  //barriers
  if (righty<150) {
    righty=150;
  }
  if (lefty<150) {
    lefty=150;
  }

  if (righty>450) {
    righty=450;
  }

  if (lefty>450) {
    lefty=450;
  }

  //MOVING

  if (wkey==true) lefty=lefty-5;
  if (skey==true) lefty=lefty+5;

  if (AI==false) {
    if (upkey==true) righty=righty-5;
    if (downkey==true) righty=righty+5;
  } else if (AI==true) {
    if (ballx>450) { //if ball x is more than 

      if (bally<300) {
        if (righty<130) {  // if ball y is less than
          righty=righty-0;
        } else if (bally<300) { // if ball y is less than
          righty=righty-6;
        }
      }
      if (bally>300) {
        if (righty>540) { // if ball y is more than 
          righty=righty-0;
        } else if (bally>300) { //if ball y is more than
          righty=righty+6;
        }
      }
    }
  }



  //ball
  fill(255);
  circle(ballx, bally, balld);

  if (timer<0) {
    bally=bally+vy;
    ballx=ballx+vx;
  }

  if (bally>590) {
    ballx=width/2;
    bally=height/2;
    timer=100;
    vx=3;
    vy=random(-4, 4);
  }

  if (bally<10) {
    timer=100;
    ballx=width/2;
    bally=height/2;
    vx=3;
    vy=random(-4, 4);
  }

  //bouncing
  if (bally>=height-balld/2 || bally<=0+balld/2) {
    wall.rewind();
    wall.play();
    vy = vy * -1;
  }

  if (dist(leftx, lefty, ballx, bally)<=leftd/2+balld/2) {
    left.rewind();
    left.play();
    vx=(ballx-leftx)/random(8, 25);
    vy=(bally-lefty)/random(8, 25);
  }
  if (dist(rightx, righty, ballx, bally)<=rightd/2+balld/2) {
    right.rewind();
    right.play();
    vx=(ballx-rightx)/random(8, 25);
    vy=(bally-righty)/random(8, 25);
  }

  //scoring
  if (ballx<0) {
    score.rewind();
    score.play();
    rightscore++;
    ballx=width/2;
    bally=height/2;
    timer=100;
    vx=3;
    vy=random(-4, 4);
  }
  if (ballx>800) {
    score.rewind();
    score.play();
    leftscore++;
    ballx=width/2;
    bally=height/2;
    timer=100;
    vx=3;
    vy=random(-4, 4);
  }
  if (leftscore>2) {
    mode=GAMEOVER;
  }
  if (rightscore>2) {
    mode=GAMEOVER;
  }
}



void gameClicks () {
  if (dist(mouseX, mouseY, 0, 0)<800) {
    mode= PAUSE;
  }
}
