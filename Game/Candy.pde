class Candy{
    color col;
    String type;
    PImage img;

    public Candy(color x, String CandyKind){
        this.col = x;
        this.type = CandyKind;
    }

    public void display(float x, float y){
        //width and height parameters are subject to change
        fill(col);
        noStroke();
        if (col == color(255,0,0)){
           img = loadImage("red.png");
        }
        else if (col == color(0,255,0)){
           img = loadImage("green.png");
        }
        else if (col == color(0,0,255)){
           img = loadImage("blue.png");
        }
        else if (col == color(255,255,0)){
          img = loadImage("yellow.png");
        }
        else if (col == color(255,165,0)){
          img = loadImage("orange.png");
        }
        else if (col == color(128,0,128)){
          img = loadImage("purple.png");
        }
        image(img,x-22,y-20,48,48);
        //ellipse(x,y,0.8 * 60,0.8 * 60);
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
