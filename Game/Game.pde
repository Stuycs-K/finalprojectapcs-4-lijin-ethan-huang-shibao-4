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

  void resetGame(){

  }

  void updateGame(){

  }

  boolean gameOver(){
    
  }
}
