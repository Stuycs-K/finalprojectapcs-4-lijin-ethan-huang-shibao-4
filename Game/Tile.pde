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
}
