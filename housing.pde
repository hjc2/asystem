

import java.util.Random;


class Housing extends System {

    Random rand = new Random();

    Point pt = new Point(0,0);
    Stack<Point> pts;

    // ArrayList<Rectangle> rects = new ArrayList();

    ArrayList<Line> lines = new ArrayList();

    int x = 0;
    int y = 0;

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
                addLine(pt.x, pt.y, pt.x + len, pt.y);

                pt.x += len;
            }
            if(c == 'y'){
                // addList(int(pt.x - len), pt.y, len);
                addLine(pt.x, pt.y, pt.x, pt.y + len);
                pt.y += len;
            }
            if(c == 'z'){
                addLine(pt.x - len, pt.y, pt.x, pt.y);

                // addList(int(pt.x - len), int(pt.y - len), len);
                pt.x -= len;
            }
            if(c == 'q'){
                addLine(pt.x, pt.y - len, pt.x, pt.y);
                // addList(pt.x, int(pt.y - len), len);

                pt.y -= len;
            }
        }
    }

    public void draw(){

    }

    public void addLine(int x1, int y1, int x2, int y2){
        Line tmp = new Line(x1,y1,x2,y2);
        lines.add(tmp);
    }

    public void addLine(float x1, float y1, float x2, float y2){
        Line tmp = new Line(int(x1),int(y1),int(x2),int(y2));
        lines.add(tmp);
    }

}
