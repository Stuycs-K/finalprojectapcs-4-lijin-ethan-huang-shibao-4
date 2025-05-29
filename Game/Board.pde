class Board{
    Tile[][] grid;
    private int rows;
    private int cols;
    private Candy[] candies;
    private Candy[] specialCandies;
    float tileSize;

    //initialize candies array
    public void initialize(){

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
        
    }

    public void clearMatches(){

    }

}
