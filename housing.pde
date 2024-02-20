

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
        value = "[U r U d U l U u]";

        this.add("U -> [U r U d U l U u]");
        this.add("U -> [U r U d U l U u]");
        this.add("U -> [U r U d U l U u]");
        this.add("U -> [U r U d U l U u]");

        this.add("U -> [x1yyzzqq]");

        this.add("r -> rr");
        this.add("d -> dd");
        this.add("l -> ll");
        this.add("u -> uu");

        this.add("x -> x"); // right
        this.add("y -> yy"); // down
        this.add("z -> zz"); //left
        this.add("q -> qq"); // up
        
        pts = new Stack<>();
        pts.push(pt);

    }

    public void populate(){

        for(int i=0; i<value.length(); i++) {

            char c = value.charAt(i);
            
            float len = (height) / pow(2,n);
        
            if(c == 'r'){
                pt.x += len;
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
                // println(pts.size());
            }
            if(c == ']'){
                pt = pts.pop();
            }

            if(c == 'x'){
                i++;
                c = value.charAt(i);
                int tmp = c - '0';
                float l = pow(2,tmp);
                addLine(pt.x, pt.y, pt.x + len * l, pt.y);
                pt.x += (len * l);
            }
            if(c == 'y'){
                addLine(pt.x, pt.y, pt.x, pt.y + len);
                pt.y += len;
            }
            if(c == 'z'){
                addLine(pt.x - len, pt.y, pt.x, pt.y);
                pt.x -= len;
            }
            if(c == 'q'){
                addLine(pt.x, pt.y - len, pt.x, pt.y);
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
