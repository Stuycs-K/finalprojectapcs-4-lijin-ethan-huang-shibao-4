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
}
