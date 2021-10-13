class bouncingBall
{
  color Bcolour;
  float Bradius;
  PVector Bposition;
  PVector Bvelocity;

  bouncingBall()
  {
    Bposition = new PVector(width/2, height/2);
    Bvelocity = new PVector(random(-3, 3), random(-3, 3));
  }

  void displayBouncingBalls()
  {
    noStroke();
    fill(Bcolour);
    circle(Bposition.x, Bposition.y, Bradius*2);
  }
  void moveBouncingBalls() {
    Bposition.x = Bposition.x + Bvelocity.x;
    Bposition.y = Bposition.y + Bvelocity.y;

    if (Bposition.x-Bradius <= 0 || Bposition.x+Bradius >= width) {
      Bvelocity.x = Bvelocity.x*-1;
    }
    if (Bposition.y-Bradius <= 0 || Bposition.y+Bradius >= height-100) {
      Bvelocity.y = Bvelocity.y*-1;
    }
  }
}


void displayC() {
  noStroke();
  fill(#FFFFFF);
  circle(position.x, position.y, radius*2);
}
void displayR() {
  fill(#f5f5f5);
  rect(platform.x, platform.y, 70, 10);
}
