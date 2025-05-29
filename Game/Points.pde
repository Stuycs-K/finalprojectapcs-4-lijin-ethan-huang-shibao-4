class Points {
  int score;
  
  Points() {
    score = 0;
  }
  
  void add(int points) {
    score += points;
  }
  
  void reset() {
    score = 0;
  }
  
  int getScore() {
    return score;
  }
  
  void display(int x, int y, float tileSize) {
    fill(0);
    textSize(20);
    text("Score: " + score, x, y);
  }
}
