


class Space extends System {

    FPoint pt = new FPoint(width / 2, height / 2);
    Stack<FPoint> pts;



    Space(){

        super("X");

        // this.add("X -> X[a1X][b1X][c1X][d1X]");
        this.add("X -> [aX][bX][cX][dX]");

        pts = new Stack<>();

        //a -> top left
        //b -> top right
        //c -> bottom right
        //d -> bottom left
        //X -> draw an X here

        // X -> [aX][bX][cX][dX]

        //3 5 9 17

    }

    public void populate(){

        lines = new ArrayList();

        for(int i=0; i<value.length(); i++) {

            char c = value.charAt(i);
            
            float len = width / (pow(2,n) + 1);

            // 3, 5, 9

            if(c == '['){
                pts.add(pt.clone());
            }
            if(c == ']'){
                pt = pts.pop();
            }

            if(c == 'X'){
                addLine(pt.x - len / 2, pt.y - len / 2, pt.x + len / 2, pt.y + len /2);
                addLine(pt.x - len / 2, pt.y + len / 2, pt.x + len / 2, pt.y - len /2);
            }

            if(c == 'a'){
                pt.x = pt.x - len;
                pt.y = pt.y - len;
            }
            if(c == 'b'){
                pt.x = pt.x + len;
                pt.y = pt.y - len;
            }
            if(c == 'c'){
                pt.x = pt.x + len;
                pt.y = pt.y + len;
            }
            if(c == 'd'){
                pt.x = pt.x - len;
                pt.y = pt.y + len;
            }
        }
        
        pt = new FPoint(width / 2, width /2);

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
