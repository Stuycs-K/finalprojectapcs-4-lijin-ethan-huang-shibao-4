public class Points {
  int score;
  
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
    fill(200);
    rect(x, y, tileSize, tileSize);
  }
}
