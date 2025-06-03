Board board;
Points scoreKeeper;
Tile selectedTile;
int ROWS = 9;
int COLS = 9;
float TILE_SIZE = 60;
boolean isGameOver = false;
enum GameState { WAITING, ANIMATING, MATCHING }
GameState state = GameState.WAITING;
int delayFrames = 0;
  
  void settings() {
    size(COLS * int(TILE_SIZE), ROWS * int(TILE_SIZE));
  }
  
  void setup() {
    board = new Board(ROWS, COLS, TILE_SIZE);
    board.initialize();
    scoreKeeper = new Points();
    selectedTile = null;
    if (isGameOver) {
      textAlign(CENTER, CENTER);
      textSize(36);
      fill(255, 0, 0);
      text("Game Over", width / 2, height / 2);
    }
  }
  
  void draw() {
    background(255);
    board.display();
    scoreKeeper.display(20, height - 20);
    if (state == GameState.ANIMATING) {
      delayFrames--;
      if (delayFrames <= 0) {
        state = GameState.MATCHING;
        updateGame();
      }
    }
  }
  
  void mousePressed() {
    //int col = int(mouseX / TILE_SIZE);
    //int row = int(mouseY / TILE_SIZE);
    //if (row >= board.rows || col >= board.cols) {
    //  return;
    //}
    Tile clicked = board.getTile(mouseX, mouseY);
    //if (clicked != null) {
    //  if (selectedTile == null) {
    //    selectedTile = clicked;
    //    selectedTile.select();
    //  }
    //else {
      if (clicked == null) return;
      
      if (selectedTile == null){
        selectedTile = clicked;
        selectedTile.select();
      }
      else if (selectedTile != clicked) {
        int r1 = selectedTile.getRow(board.tileSize, board.boardY);
        int c1 = selectedTile.getCol(board.tileSize, board.boardX);
        int r2 = clicked.getRow(board.tileSize, board.boardY);
        int c2 = clicked.getCol(board.tileSize, board.boardX);
        //board.swapCandies(selectedTile, clicked);
        //if (board.checkMatches(r1, c1, r2, c2)) {
        //  updateGame();
        //} else {
          if (abs(r1-r2) + abs(c1-c2) == 1){
          board.swapCandies(selectedTile, clicked);
            if(board.checkMatches(r1,c1,r2,c2)){
              updateGame();
        }else {
          board.swapCandies(selectedTile, clicked);
      }
      selectedTile.deselect();
      selectedTile = null;
     }
    }
  }
   
  void resetGame(){
    scoreKeeper.reset();
    board.initialize();
    selectedTile = null;
  }

  void updateGame(){
    boolean matched = true;
    while (matched) {
      matched = false;
      for (int r = 0; r < board.rows; r++) {
        for (int c = 0; c < board.cols; c++) {
          if (board.markRun(r, c)) {
            matched = true;
          }
        }
      }
      if (matched) {
        int cleared = board.clearMatches();
        scoreKeeper.add(cleared * 10);
        board.dropCandies();
      }
    }
    if (!board.hasMoves()) {
      isGameOver = true;
    }
  }

  boolean gameOver(){
    return !board.hasMoves();
  }
