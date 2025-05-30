class Board{
    Tile[][] grid;
    int rows;
    int cols;
    Candy[] candies;
    Candy[] specialCandies;
    float tileSize;
    int moves;
    int boardX;
    int boardY;

    public Board(int r, int c){
        this.rows = r;
        this.cols = c;
    }

    //initialize candies array
    public void initialize(){
        boardX = 50;
        boardY = 80;
        moves = 20;

        this.tileSize = tile.row * tile.col;

        this.candies = new Candy[6];
        candies[0] = new Candy(color(255,0,0), "solid"); //red
        candies[1] = new Candy(color(0,255,0), "solid"); //green
        candies[2] = new Candy(color(0,0,255), "solid"); //blue
        candies[3] = new Candy(color(255,255,0), "solid"); //yellow
        candies[4] = new Candy(color(255,165,0), "solid"); //orange
        candies[5] = new Candy(color(128,0,128), "solid"); //purple

        this.specialCandies = Candy[7];
        candies[0] = new Candy(color(255,0,0), "striped"); //red
        candies[1] = new Candy(color(0,255,0), "striped"); //green
        candies[2] = new Candy(color(0,0,255), "striped"); //blue
        candies[3] = new Candy(color(255,255,0), "striped"); //yellow
        candies[4] = new Candy(color(255,165,0), "striped"); //orange
        candies[5] = new Candy(color(128,0,128), "striped"); //purple
        candies[6] = new Candy(color(0,0,0), "disco"); //black (disco ball);


        grid = Tile[rows][cols];

        //initialize array with just solids first

        for (int i = 0; i < grid.length; i++){
            for (int j = 0; j < grid[i].length; j++){
                int randomCandyIndex = (int) (Math.random() * 7);
                grid[i][j] = candies[randomCandyIndex];
            }
        }

        //change some of the tiles to have 
        for (int i = 0; i < grid.length; i++){
            int randomCol = (int) (Math.random() * grid.length);
            int SpecialCandyIndex = (int) (Math.random() * 8);
            int isThereSpecial = (int) (Math.random() * 11);

            if (isThereSpecial > 7){
                grid[i][randomCol] = new Tile(row,col, specialCandies[SpecialCandyIndex]);
            }
        }
    }

    public void display(){
        stroke(200);
        noFill();

        for (int i = 0; i < rows; i++){
            for (int j = 0; j < cols; j++){
                float x0 = i * tileSize;
                float y0 = j * tileSize;

                rect(x0, y0, tileSize, tileSize);

                Candy cd = grid[r][c].candy;

                if(cd!= null){
                    float cx = x0 + tileSize / 2;
                    float cy = x0 + tileSize / 2;
                    cd.display(cx, cy);
                }
            }
        }
    }

    public void swap(Tile t1, Tile t2){
        Tile temporary = t2;
        t2 = t1; 
        t1 = temporary;
    }

    public boolean checkMatches(){
        //iterate from top to bottom and left to right to check for a group of 3
         int clickCount = 0;

        if (clickCount < 2){
            if (mousePressed){
                if (clickCount == 0){
                    getTileAt(mouseX, mouseY);
                    clickCount++;
                    if (getTileAt(mouseX, mouseY) == null){
                        clickCount--;
                        //probably print something to say select a valid tile
                    }
                }
                else if (clickCount == 1){
                    getTileAt(mouseX, mouseY);
                    clickCount++;
                    if (getTileAt(mouseX, mouseY) == null){
                        clickCount--;
                        //probably print something saying to select a valid tile
                    }
                }
            
        }


    }


    }

    public Tile getTileAt(int xCord, int yCord){
        int tileCol = (boardX - xCord) * tileSize;
        int tileRow = (boardY - yCord) * tileSize;
        if (tileCol < 0 || tileCol > cols || tileRow < 0 || tileRow > rows){
            return null;
        }
        return grid[row][col];
    }

    public void clearMatches(){

    }

    public void dropCandies(){
        //moving all the candies above it down one column and then adding additional candies. 
    }

    public void refillBoard(){
        for (int i = 0; i < grid.length; i++){
            for (int j = 0; j < grid[i].length; j++){
                int randomCandyIndex = (int) (Math.random() * 7);
                grid[i][j] = candies[randomCandyIndex];
            }
        }

        //change some of the tiles to have 
        for (int i = 0; i < grid.length; i++){
            int randomCol = (int) (Math.random() * grid.length);
            int SpecialCandyIndex = (int) (Math.random() * 8);
            int isThereSpecial = (int) (Math.random() * 11);

            if (isThereSpecial > 7){
                grid[i][randomCol] = new Tile(row,col, specialCandies[SpecialCandyIndex]);
            }
        }
    }

    public boolean hasMoves(){
        //check if theres any possible checkMatches
        <ArrayList> 
    }

}
