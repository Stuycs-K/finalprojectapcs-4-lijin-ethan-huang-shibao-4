Board board;
Points scoreKeeper;
Tile selectedTile;
int ROWS = 9;
int COLS = 9;
float TILE_SIZE = 60;
boolean isGameOver = false;
enum GameState { WAITING, ANIMATING, MATCHING };
GameState state = GameState.WAITING;
int delayFrames = 0;
ScreenState screenState = ScreenState.MENU;
enum ScreenState { MENU, GAME };
int startButtonX;
int startButtonY;
int startButtonW = 200; 
int startButtonH = 80;
int resetButtonW = 100;
int resetButtonH = 25;
int resetButtonX;
int resetButtonY;

PImage bg;
  
  void settings() {
    size(COLS * int(TILE_SIZE), ROWS * int(TILE_SIZE) + 80);
    bg = loadImage("bg.png");
  }
  
  void setup() {
    startButtonX = width / 2 - startButtonW / 2;
    startButtonY = height / 2 - startButtonH / 2;
    resetButtonX = 15;
    resetButtonY = 12;
    
    board = new Board(ROWS, COLS, TILE_SIZE);
    board.initialize();
    scoreKeeper = new Points();
    selectedTile = null;
    if (isGameOver) {
      textAlign(CENTER, CENTER);
      textSize(25);
      fill(255, 0, 0);
      text("Game Over", width / 2, height / 2);
    }
  }
  
  void draw() {
    image(bg, 0, 0, width, height);
    board.display();
    
    if (state == GameState.ANIMATING) {
      delayFrames--;
      if (delayFrames <= 0) {
        state = GameState.MATCHING;
        updateGame();
      }
    }
    if (screenState == ScreenState.MENU) {
      drawMainMenu();
    } 
    else if (screenState == ScreenState.GAME) {
      board.display();
       noStroke();
    fill(0,0,255);
    rect(resetButtonX, resetButtonY, resetButtonW, resetButtonH, 12);
    fill(255);
    textSize(15);
    textAlign(CENTER,CENTER);
    text("reset board", resetButtonX + resetButtonW / 2, resetButtonY + resetButtonH / 2);
      scoreKeeper.display(width / 2, 20);
      if (state == GameState.ANIMATING) {
        delayFrames--;
        if (delayFrames <= 0) {
          state = GameState.MATCHING;
          updateGame();
        }
      }
      if (isGameOver) {
        fill(255, 0, 0);
        textAlign(CENTER, CENTER);
        textSize(36);
        text("Game Over", width / 2, height / 2);
      }
    }
  }
  
  void drawMainMenu() {
    image(bg, 0, 0, width, height);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(60);
    text("Candy Crush", width / 2, height / 2 - 100);
    noStroke();
    fill(0, 200, 100);
    rect(startButtonX, startButtonY, startButtonW, startButtonH, 20);
    fill(255);
    textSize(32);
    text("Start", width / 2, height / 2);
  }
  
  void mousePressed() {
    if (screenState == ScreenState.MENU) {
      if (mouseX >= startButtonX && mouseX <= startButtonX + startButtonW && mouseY >= startButtonY && mouseY <= startButtonY + startButtonH) {
        startGame();
      }
      return;
    }
    
    if (screenState == ScreenState.GAME && mouseX >= resetButtonX && mouseX <= resetButtonX + resetButtonW && mouseY >= resetButtonY && mouseY <= resetButtonY + resetButtonH) {
      resetGame();
      return;
    }
    
    Tile clicked = board.getTile(mouseX, mouseY);
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
   
   void startGame() {
     board = new Board(ROWS, COLS, TILE_SIZE);
     board.initialize();
     scoreKeeper = new Points();
     selectedTile = null;
     isGameOver = false;
     state = GameState.WAITING;
     screenState = ScreenState.GAME;
  }

  void resetGame(){
    scoreKeeper.reset();
    board.initialize();
    selectedTile = null;
    isGameOver = false;
    state = GameState.WAITING;
    delayFrames = 0;
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
        delayFrames = 15;
        state = GameState.ANIMATING;
        return;
      }
    }
    if (!board.hasMoves()) {
      isGameOver = true;
    }
  }

  boolean gameOver(){
    return !board.hasMoves();
  }
