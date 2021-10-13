class Timer {
  boolean startTimer;
  int millisecs;
  int secs;
  int min;

  Timer() {
    startTimer = false;
  }

  void displayTimer() {
    if (startTimer) {
      if (int(millis()/100)  % 10 != millisecs) {
        millisecs++;
      }
      if (millisecs >= 10) {
        millisecs -= 10;
        secs++;
      }
      if (secs >= 60) {
        secs -= 60;
        min++;
      }
    }

    textAlign(CENTER);
    fill(255);
    textSize(15);
    strokeWeight(4);
    text(nf(min, 2) + ":" + nf(secs, 2) + "." + nf(millisecs, 1), 30, 20);
  }
}
