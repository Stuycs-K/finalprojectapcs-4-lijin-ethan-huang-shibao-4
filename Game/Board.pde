public class Board{
    private Tile[][] grid;
    private int rows;
    private int cols;

    public void initialize(){
        grid = Tile[rows][cols];

        for (int i = 0; i < rows; i++){
            for (int j = 0; j < cols; j++){
                int randomCandy = Math.random()
            }
        }
    }

    public void display(){

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