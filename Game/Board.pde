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
    boolean[][] canClear;


    public Board(int r, int c, float tileSize){
        this.rows = r;
        this.cols = c;
        this.tileSize = tileSize;
    }

    //initialize candies array
    public void initialize(){
        boardX = (width - cols * int(tileSize)) / 2;
        boardY = (height - rows * int(tileSize)) / 2;
        moves = 20;

        canClear = new boolean[rows][cols];
        this.tileSize = TILE_SIZE;

        this.candies = new Candy[6];
        candies[0] = new Candy(color(255,0,0), "solid"); //red
        candies[1] = new Candy(color(0,255,0), "solid"); //green
        candies[2] = new Candy(color(0,0,255), "solid"); //blue
        candies[3] = new Candy(color(255,255,0), "solid"); //yellow
        candies[4] = new Candy(color(255,165,0), "solid"); //orange
        candies[5] = new Candy(color(128,0,128), "solid"); //purple

        this.specialCandies = new Candy[7];
        specialCandies[0] = new Candy(color(255,0,0), "striped"); //red
        specialCandies[1] = new Candy(color(0,255,0), "striped"); //green
        specialCandies[2] = new Candy(color(0,0,255), "striped"); //blue
        specialCandies[3] = new Candy(color(255,255,0), "striped"); //yellow
        specialCandies[4] = new Candy(color(255,165,0), "striped"); //orange
        specialCandies[5] = new Candy(color(128,0,128), "striped"); //purple
        specialCandies[6] = new Candy(color(0,0,0), "disco"); //black (disco ball);


        grid = new Tile[rows][cols];

        //initialize array with just solids first


        for (int i = 0; i < grid.length; i++){
            for (int j = 0; j < grid[i].length; j++){
                int randomCandyIndex = (int) (Math.random() * candies.length);
                grid[i][j] = new Tile((int) (boardX + j * tileSize),(int) (boardY + i * tileSize), candies[randomCandyIndex]);
            }
        }

        //change some of the tiles to have 
        for (int i = 0; i < grid.length; i++){
            int randomCol = (int) (Math.random() * grid.length);
            int SpecialCandyIndex = (int) (Math.random() * specialCandies.length);
            int isThereSpecial = (int) (Math.random() * 11);

            if (isThereSpecial > 7){
                grid[i][randomCol] = new Tile((int) (boardX + randomCol * tileSize), (int) (boardY + i * tileSize), specialCandies[SpecialCandyIndex]);
            }
        }
    }

    public void display(){
        stroke(200);
        noFill();

        for (int r = 0; r < rows; r++){
            for (int c = 0; c < cols; c++){
                float x0 = boardX + c * tileSize;
                float y0 = boardY + r * tileSize;

                rect(x0, y0, tileSize, tileSize);

                Candy cd = grid[r][c].candy;

                if(cd!= null){
                    float cx = x0 + tileSize / 2;
                    float cy = y0 + tileSize / 2;
                    cd.display(cx, cy);
                }
            }
        }
    }

    public void swapCandies(Tile t1, Tile t2){
        Candy temporary = t2.candy;
        t2.candy = t1.candy; 
        t1.candy = temporary;
    }


    public Tile getTile(int xCord, int yCord){
        int tileCol = (int) ((xCord - boardX) / tileSize);
        int tileRow = (int) ((yCord - boardY) / tileSize);
        if (tileCol < 0 || tileCol >= cols || tileRow < 0 || tileRow >= rows){
            return null;
        }
        return grid[tileRow][tileCol];
    }


    public void refillBoard(){
        for (int i = 0; i < grid.length; i++){
            for (int j = 0; j < grid[i].length; j++){
                int randomCandyIndex = (int) (Math.random() * candies.length);
                grid[i][j] = new Tile((int) (boardX + j * tileSize), (int) (boardY + i * tileSize), candies[randomCandyIndex]);
            }
        }

        //change some of the tiles to have 
        for (int i = 0; i < grid.length; i++){
            int randomCol = (int) (Math.random() * grid.length);
            int SpecialCandyIndex = (int) (Math.random() * specialCandies.length);
            int isThereSpecial = (int) (Math.random() * 11);

            if (isThereSpecial > 7){
                grid[i][randomCol] = new Tile((int) (boardX + randomCol * tileSize), (int) (boardY + i * tileSize), specialCandies[SpecialCandyIndex]);
            }
        }
    }

    public boolean markRun(int r, int c){
        color shade = grid[r][c].candy.col;
        boolean found = false;

        int left = c;
        int right = c;

        while (left - 1>=0 
        && grid[r][left - 1].candy != null
        && grid[r][left - 1].candy.col ==(shade)
        ){
            left--;
        }

        while (right + 1 < cols 
        && grid[r][right + 1].candy != null
        && grid[r][right + 1].candy.col ==(shade)
        ){
            right++;
        }

        int up = r;
        int down = r;

        while (up - 1 >= 0
        && grid[up - 1][c].candy !=null
        && grid[up - 1][c].candy.col ==(shade)
        ){
            up--;
        }

        while (down + 1 < rows
        && grid[down + 1][c].candy !=null
        && grid[down + 1][c].candy.col ==(shade)
        ){
            down++;
        }

        int vlength = down - up + 1;
        int hlength = right - left + 1;

        if (vlength >= 3){
            for (int rr = up; rr <= down; rr++){
                canClear[rr][c] = true;
            }
            found = true;
        }
        
        if (hlength >=3){
            for (int cc = left; cc <= right; cc++){
                canClear[r][cc] = true;
            }
            found = true;
        }
        return found;
    }

    public boolean checkMatches(int r1, int c1, int r2, int c2){
        for (int r = 0; r < rows; r++){
            for (int c = 0; c< cols; c++){
                canClear[r][c] = false;
            }
        }

        boolean foundMatch = false;

        if (grid[r1][c1].candy!= null){
            if (markRun(r1,c1)){
                foundMatch = true;
            }
        }

        if (grid[r2][c2].candy!= null){
            if (markRun(r2,c2)){
                foundMatch = true;
            }
        }
        
        return foundMatch;
    }

    public int clearMatches(){
        int clearedCandies = 0;

        for (int r = 0; r < rows; r++){
            for (int c = 0; c < cols; c++){
                if (canClear[r][c]){
                    grid[r][c].candy = null;
                    clearedCandies++;
                }
            }
        }

        for (int r = 0; r < rows; r++){
            for (int c = 0; c < cols; c++){
                canClear[r][c] = false;
            }
        }

        return clearedCandies;
    }

    public void dropCandies(){
        //moving all the candies above it down one column and then adding additional candies. 

        for (int c = 0; c < cols; c++){
            int newRow = rows - 1;
            for (int r = rows - 1; r >= 0; r--){
                if (grid[r][c].candy != null){
                    if (newRow != r) {
                      grid[newRow][c].candy = grid[r][c].candy;
                    }
                    newRow--;
                }
            }

            for (int r = newRow; r >= 0; r--){
                grid[r][c].candy = null;
            }
        }
        for (int r = 0; r < rows; r++){
            for (int c = 0; c < cols; c++){
                if (grid[r][c].candy == null){
                    int randomCandyIndex = (int) (Math.random() * candies.length);
                    grid[r][c].candy = candies[randomCandyIndex];
                }
            }
        }
    }


    public boolean hasMoves(){
        //iterate through each tile and check if a combination of 3 can be made.

        for (int r = 0; r < rows; r++){
            for (int c = 0; c < cols; c++){
                Tile t = grid[r][c];

                if (c + 1 < cols){
                    Tile right = grid[r][c+1];
                    swapCandies(t, right);

                    boolean makesMatch = checkMatches(r, c, r, c + 1);
                    swapCandies(t,right);

                    if(makesMatch) return true;
                }
                
                if (r + 1 < rows){
                    Tile down = grid[r+1][c];
                    swapCandies(t,down);
                    
                    boolean makesMatch = checkMatches(r,c,r+1, c);
                    swapCandies(t,down);
                    if(makesMatch) return true;
                }
            }
            }
        return false;
    }

}
