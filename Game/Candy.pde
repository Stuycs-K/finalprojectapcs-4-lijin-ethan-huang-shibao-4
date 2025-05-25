public class Candy{
    private color col;
    private String type;

    public Candy(color x, String CandyKind){
        this.col = x;
        this.type = CandyKind;
    }

    public void display(float x, float y){
        //width and height parameters are subject to change
        ellipse(x,y,10,10);
    }

    public color getColor(){
        return this.col;
    }

    public boolean equals(Candy c){
        if (c == null) return false;

        return this.getColor() == c.getColor();
    }

}