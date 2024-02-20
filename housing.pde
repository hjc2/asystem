

import java.util.Random;


class Housing extends System {

    Random rand = new Random();

    Point pt = new Point(0,0);
    Stack<Point> pts;

    ArrayList<Rectangle> rects = new ArrayList();


    Housing(){

        super("U");

        this.add("U -> [U r U d U l U]");
        this.add("U -> [U r U d U l U]");
        this.add("U -> [U r U d U l U]");
        this.add("U -> [U r U d U l U]");
        this.add("U -> [U r U d U l U]");
        this.add("U -> [U r U d U l U]");
        this.add("U -> [U r U d U l U]");
        this.add("U -> [U r U d U l U]");
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
        this.add("x -> xx"); 
        this.add("y -> yy");
        this.add("z -> zz");
        this.add("q -> qq");
        
        pts = new Stack<>();

    }

    public void draw(){

        noFill();
        rectMode(CORNER);

        stroke(0);
        strokeWeight(2);

        for(int i=0; i<value.length(); i++) {

            char c = value.charAt(i);
            
            float len = (height) / pow(2,n);

            if(c == 'r'){
                translate(len,0);
            }
            if(c == 'd'){
                translate(0,len);
            }
            if(c == 'l'){
                translate(-len,0);
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
                line(0,0,len,0);
                translate(len,0);
            }
            if(c == 'y'){
                line(0,0,0,len);
                translate(0,len);
            }
            if(c == 'z'){
                line(0,0,-len,0);
                translate(-len,0);
            }
            if(c == 'q'){
                line(0,0,0,-len);
                translate(0,-len);
            }
        }
    }

    public void populate(){

        for(int i=0; i<value.length(); i++) {

            char c = value.charAt(i);
            
            float len = (height) / pow(2,n);

            if(c == 'r'){
                pt.x -= len;
                addList(len);
            }
            if(c == 'd'){
                pt.y -= len;
                addList(len);
            }
            if(c == 'l'){
                pt.x += len;
                addList(len);
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
                pt.x -= len;
                addList(len);
            }
            if(c == 'y'){
                pt.y -= len;
                addList(len);
            }
            if(c == 'z'){
                pt.x += len;
                addList(len);
            }
            if(c == 'q'){
                pt.y += len;
                addList(len);
            }
        }
    }

    void addList(float len){
        Rectangle rmp = new Rectangle(pt.x, pt.y, int(len), int(len));
        rects.add(rmp);
        print("this ran!");
    }

}
