void collisionWP() {
  if (position.x-radius <= 0 || position.x+radius >= width) {
    velocity.x = velocity.x*-1;
  } else if (position.y-radius <= 25) {
    velocity.y = velocity.y*-1;
  } else if (position.y-radius >= platform.y-5) {
    if (position.x-radius >= platform.x-35) {
      if (position.x+radius <= platform.x+70) {
        velocity.y = velocity.y*-1;
      }
    }
  }
}
void gameOver() {
  if (position.y+radius >= height-35) {
    noLoop();
    fill(#A7A7A7);
    noStroke();
    rect(width/2-100, height/2-30, 200, 100);
    stroke(1);
    textSize(30);
    fill(#FFFFFF);
    textAlign(CENTER);
    text("GAME OVER!", width/2, height/2);
    restart();
  }
}

void moveBall() {
  position.x = position.x + velocity.x;
  position.y = position.y + velocity.y;
}
