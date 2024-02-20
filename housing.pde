

import java.util.Random;


class Housing extends System {

    Random rand = new Random();

    FPoint pt = new FPoint(0.0,0.0);
    Stack<FPoint> pts;

    ArrayList<Line> lines = new ArrayList();

    int x = 0;
    int y = 0;

    Housing(){

        super("U");

        stack.push("U");
        n += 1;
        value = "[U r0 U d U l U u]";

        this.add("U -> [U r0 U d U l U u]");
        this.add("U -> [U r0 U d U l U u]");
        this.add("U -> [U r0 U d U l U u]");
        this.add("U -> [U r0 U d U l U u]");
        this.add("U -> [U r0 U d U l U u]");


        // this.add("U -> [U r1 U d U l U u]");
        // this.add("U -> [U r1 U d U l U u]");
        // this.add("U -> [U r1 U d U l U u]");
        // this.add("U -> [U r1 U d U l U u]");


        this.add("U -> [x1y1z1q1]");

        this.add("r -> r");
        this.add("d -> dd");
        this.add("l -> ll");
        this.add("u -> uu");

        this.add("x -> x"); // right
        this.add("y -> y"); // down
        this.add("z -> z"); //left
        this.add("q -> q"); // up
        
        pts = new Stack<>();
        pts.push(pt);

    }

    public void populate(){

        for(int i=0; i<value.length(); i++) {

            char c = value.charAt(i);
            
            float len = (height) / pow(2,n);
        
            if(c == 'r'){
                i++;
                float l = calculateL(value.charAt(i));

                pt.x += len * l;
                // pt.x += len;
            }
            if(c == 'd'){
                pt.y += len;
            }
            if(c == 'l'){
                pt.x -= len;
            }
            if(c == 'u'){
                pt.y -= len;
            }

            if(c == '['){
                pts.add(pt);
            }
            if(c == ']'){
                pt = pts.pop();
            }

            if(c == 'x'){
                i++;
                float l = calculateL(value.charAt(i));
                addLine(pt.x, pt.y, pt.x + len * l, pt.y);
                pt.x += (len * l);
            }
            if(c == 'y'){
                i++;
                float l = calculateL(value.charAt(i));
                addLine(pt.x, pt.y, pt.x, pt.y + len * l);
                pt.y += (len * l);
            }
            if(c == 'z'){
                i++;
                float l = calculateL(value.charAt(i));
                addLine(pt.x - len * l, pt.y, pt.x, pt.y);
                pt.x -= len * l;
            }
            if(c == 'q'){
                i++;
                float l = calculateL(value.charAt(i));
                addLine(pt.x, pt.y - len * l, pt.x, pt.y);
                pt.y -= len * l;
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


    public float calculateL(char c){

        int tmp = c - '0';
        float l = pow(2,tmp);

        return(l);
    }

}
