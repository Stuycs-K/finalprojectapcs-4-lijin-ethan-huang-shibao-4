Board board;
Points scoreKeeper;
Tile selectedTile;
int ROWS = 9;
int COLS = 9;
float TILE_SIZE = 60;
  
  void settings() {
    size(COLS * int(TILE_SIZE), ROWS * int(TILE_SIZE));
  }
  
  void setup() {
    board = new Board(ROWS, COLS);
    board.initialize();
    scoreKeeper = new Points();
    selectedTile = null;
  }
  
  void draw() {
    background(255);
    board.display();
    scoreKeeper.display(20, height - 20);
  }
  
  void mousePressed() {
    int col = int(mouseX / TILE_SIZE);
    int row = int(mouseY / TILE_SIZE);
    if (row >= board.rows || col >= board.cols) {
      return;
    }
    Tile clicked = board.getTile(row, col);
    if (selectedTile == null) {
      selectedTile = clicked;
      selectedTile.select();
    }
    else {
      selectedTile.swap(clicked);
      int r1 = selectedTile.getRow();
      int c1 = selectedTile.getCol();
      int r2 = clicked.getRow();
      int c2 = clicked.getCol();
      if (board.checkMatches(r1, c1, r2, c2)) {
          board.moves--;
          updateGame();
          if (gameOver()) {
            println("Game Over!");
           }
      }
      else {
        selectedTile.swap(clicked);
      }
    }
    selectedTile.deselect();
    selectedTile = null;
   }
   
  void resetGame(){
    scoreKeeper.reset();
    board.initialize();
    selectedTile = null;
  }

  void updateGame(){
    int col = int(mouseX / TILE_SIZE);
    int row = int(mouseY / TILE_SIZE);
    Tile clicked = board.getTile(row, col);
    selectedTile = clicked;
    int r1 = selectedTile.getRow();
    int c1 = selectedTile.getCol();
    int r2 = clicked.getRow();
    int c2 = clicked.getCol();
    while (board.checkMatches(r1, c1, r2, c2)) {
      int cleared = board.clearMatches();
      scoreKeeper.add(cleared * 10);
      board.dropCandies();
      board.refillBoard();
    }
  }

  boolean gameOver(){
    return !board.hasMoves();
  }
