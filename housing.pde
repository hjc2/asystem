

import java.util.Random;


class Housing extends System {

    Random rand = new Random();

    Point pt = new Point(0,0);
    Stack<Point> pts;

    // ArrayList<Rectangle> rects = new ArrayList();

    int x = 0;
    int y = 0;

    Housing(){

        super("U");

        this.add("U -> [U r U d U l U]");
        this.add("U -> [U r U d U l U]");
        this.add("U -> [U r U d U l U]");
        this.add("U -> [U r U d U l U]");

        // has to go to double, or else they will be insufficiently small
        // could also double the length of the drawing.
        this.add("U -> [xxyyzzqq]");

        this.add("r -> rr");
        this.add("d -> dd");
        this.add("l -> ll");

        // this doubling preserves the size of the squares as the len divides every time.
        this.add("x -> xx"); // right
        this.add("y -> yy"); // down
        this.add("z -> zz"); //left
        this.add("q -> qq"); // up
        
        pts = new Stack<>();

    }

    public void populate(){

        noFill();
        rectMode(CORNER);

        stroke(0);
        strokeWeight(2);

        for(int i=0; i<value.length(); i++) {

            char c = value.charAt(i);
            
            float len = (height) / pow(2,n);
        
            if(c == 'r'){
                // translate(len,0);
                pt.x += len;
            }
            if(c == 'd'){
                // translate(0,len);
                pt.y += len;
            }
            if(c == 'l'){
                // translate(-len,0);
                pt.x -= len;
            }

            if(c == '['){
                pushMatrix(); 
                pts.add(pt);
            }
            if(c == ']'){
                popMatrix();
                pt = pts.pop();
            }

            if(c == 'x'){
                // addList(pt.x, pt.y, len);
                pt.x += len;
            }
            if(c == 'y'){
                addList(int(pt.x - len), pt.y, len);
                pt.y += len;
            }
            if(c == 'z'){
                addList(int(pt.x - len), int(pt.y - len), len);
                pt.x -= len;
            }
            if(c == 'q'){
                addList(pt.x, int(pt.y - len), len);
                pt.y -= len;
            }
        }
    }

    public void draw(){

    }

    void addList(int x, int y, float len){
        Rectangle rmp = new Rectangle(x, y, int(len), int(len));
        rects.add(rmp);
        // print("this ran!");
    }

}
