public class Game {
  Board board;
  Points scoreKeeper;
  Tile selectedTile
  int ROWS = 9;
  int COLS = 9;
  float TILE_SIZE = 60;
  
  void setup() {
    size(COLS * int(TILE_SIZE));
    board = new Board(ROWS, COLS);
    board.initialize();
    scoreKeeper = new Points();
    selectedTile = null;
  }
  
  void draw() {
    background(255);
    scoreKeeper.display(20, height - 20);
  }
  
  void mousePressed() {
    if (gameOver()) {
      return;
    }
    int col = int(mouseX / TILE_SIZE);
    int row = int(mouseY / TILE_SIZE);
    if (row >= board.rows || col >= board.cols) {
      return;
    }
    Tile clicked = board.getTile(row, col);
    
    
  }

  void resetGame(){
    scoreKeeper.reset();
    board.initialize();
    selectedTile = null;
  }

  void updateGame(){
    while (board.checkMatches()) {
      int cleared = board.clearMatches();
      scoreKeeper.add(cleared * 10);
      board.dropCandies();
      board.fillEmpty();
    }
  }

  boolean gameOver(){
    return !board.hasMoves();
  }
}
