PVector position;
PVector velocity;
PVector platform;
float radius;
boolean inPlay;
bouncingBall[] bouncingBalls;
color infectedColour;
int infected;
Timer timer;

void setup() {
  size(500, 600);
  radius = 5;
  timer = new Timer();  
  
  infected = 0;
  infectedColour = color(#0DFAA1);
  bouncingBalls = new bouncingBall[70];
  for (int i=0; i<bouncingBalls.length; i = i+1) {
    bouncingBalls[i] = new bouncingBall();
    bouncingBalls[i].Bcolour = color(random(20, 70), random(100, 150), random(150, 200));
    bouncingBalls[i].Bradius = random(6, 20);
  }

  position = new PVector (width/2, height/2+245);
  velocity = new PVector (0, 0);

  inPlay = false;
}
void mousePressed()
{
  if (inPlay) {
  } else {
    velocity.x = (mouseX - position.x) / 1000;
    velocity.y = (mouseY - position.y) / 1000;
    inPlay = true;
    timer.startTimer = true;
  }
}


void draw() {
  background(#333333);
  stroke(#FA0808);
  strokeWeight(2);
  platform = new PVector (mouseX-35, height-50);

  for (bouncingBall ball : bouncingBalls) {
    ball.displayBouncingBalls();
    ball.moveBouncingBalls();

    if (dist(position.x, position.y, ball.Bposition.x, ball.Bposition.y) < radius + ball.Bradius) {
      if (ball.Bcolour != infectedColour) {
        ball.Bcolour = infectedColour;
        infected++;
      }
    }

    if (inPlay) {
      timer.displayTimer();
      moveBall();

      displayC();
      displayR();

      gameOver();

      collisionWP();
    } else {
      displayC();

      stroke(255);
      line(position.x, position.y, mouseX, mouseY);
      textSize(20);
      fill(#FFFFFF);
      textAlign(CENTER);
      text("click to start", width/2, height/2);
      
    }
    if (infected == 70) {
      noLoop();
      fill(#A7A7A7);
      noStroke();
      rect(width/2-100, height/2-30, 200, 100);
      stroke(1);
      textSize(30);
      fill(#FFFFFF);
      textAlign(CENTER);
      text("YOU WON!", width/2, height/2);
      inPlay = false;
      restart();
    }
  }
}

void restart() {
  textSize(20);
  text("Press 'R' to restart", width/2, height/2+30);
  text("Press 'E' to exit", width/2, height/2+60);
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    setup();
    draw();
    loop();
  } else if (key == 'e' || key == 'E') {
    exit();
  }
}
