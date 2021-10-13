PVector position;
PVector velocity;
PVector platform;
float radius;
boolean inPlay;
bouncingBall[] bouncingBalls;
color brokenColour;
int score;
Timer timer;

void setup() {
  size(500, 600);
  radius = 5;
  timer = new Timer();

  score = 0;
  brokenColour = color(#333333, 0);
  bouncingBalls = new bouncingBall[50];
  for (int i=0; i<bouncingBalls.length; i = i+1) {
    bouncingBalls[i] = new bouncingBall();
    bouncingBalls[i].Bcolour = color(random(20, 70), random(150, 220), random(80, 130));
    bouncingBalls[i].Bradius = random(10, 20);
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
      if (!ball.ballBroken) {
        ball.ballBroken = true;
        velocity.x = velocity.x*-1;
        velocity.y = velocity.y*-1;

        ball.Bcolour = brokenColour;
        score++;
      }
    }

    if (inPlay) {
      bar();
      score();
      timer.displayTimer();
      moveBall();

      displayC();
      displayR();

      gameOver();

      collisionWP();
    } else {
      bar();
      displayC();

      stroke(255);
      line(position.x, position.y, mouseX, mouseY);
      textSize(20);
      fill(#FFFFFF);
      textAlign(CENTER);
      text("click to start", width/2, height/2);
    }
    if (score == 50) {
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
      score();
      timer.displayTimer();
      noLoop();
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

void score() {
  stroke(1);
  textSize(20);
  fill(#FFFFFF);
  text("Score: "+score, width-40, 20);
}
