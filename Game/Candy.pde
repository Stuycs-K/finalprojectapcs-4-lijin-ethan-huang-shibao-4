class Candy{
    color col;
    String type;

    public Candy(color x, String CandyKind){
        this.col = x;
        this.type = CandyKind;
    }

    public void display(float x, float y){
        //width and height parameters are subject to change
        fill(col);
        noStroke();
        ellipse(x,y,10,10);
    }

    public color getColor(){
        return this.col;
    }

    public void setColor(color x){
        this.col = x;
    }

    public boolean equals(Candy c){
        if (c == null) return false;

        return this.getColor() == c.getColor();
    }

}
