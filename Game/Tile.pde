class Tile {
  int row;
  int col;
  Candy candy;
  boolean isSelected;
  
  Tile(int row, int col, Candy candy) {
    this.row = row;
    this.col = col;
    this.candy = candy;
    this.isSelected = false;
  }
  
  int getRow(float tileSize, int boardY) {
    return int((row - boardY) / tileSize);
  }
  
  int getCol(float tileSize, int boardX) {
    return int((col - boardX) / tileSize);
  }
  
  void select() {
    isSelected = true;
  }

  void deselect() {
    isSelected = false;
  }

  void swap(Tile other) {
    Candy temp = this.candy;
    this.candy = other.candy;
    other.candy = temp;
  }
  
  void display(float tileSize) {
    float x = col;
    float y = row;
    if (isSelected) {
      stroke(255, 0, 0);
      strokeWeight(4);
    } 
    else {
      stroke(0);
      strokeWeight(1);
    }
    fill(200);
    rect(x, y, tileSize, tileSize);
  }
}
