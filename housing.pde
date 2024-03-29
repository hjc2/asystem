

class Housing extends System {

    FPoint pt = new FPoint(0.0,0.0);
    Stack<FPoint> pts;



    Housing(){

        super("U");

        stack.push("U");
        n += 1;
        value = "[U r0 U d0 U l0 U u0]";

        this.add("U -> [U r0 U d0 U l0 U u0]");
        this.add("U -> [U r0 U d0 U l0 U u0]");
        this.add("U -> [U r0 U d0 U l0 U u0]");
        this.add("U -> [U r0 U d0 U l0 U u0]");
        this.add("U -> [U r0 U d0 U l0 U u0]");
        this.add("U -> [U r0 U d0 U l0 U u0]");
        this.add("U -> [U r0 U d0 U l0 U u0]");
        this.add("U -> [U r0 U d0 U l0 U u0]");
        this.add("U -> [U r0 U d0 U l0 U u0]");

        this.add("U -> [x1y1z1q1]");
        pts = new Stack<>();
        pts.push(pt);
    }

    public void populate(){

        lines = new ArrayList();

        for(int i=0; i<value.length(); i++) {

            char c = value.charAt(i);
            
            float len = (height) / pow(2,n);
        
            if(c == 'r'){
                i++;
                float l = calculateL(value.charAt(i));

                pt.x += len * l;
            }
            if(c == 'd'){
                i++;
                float l = calculateL(value.charAt(i));

                pt.y += len * l;
            }
            if(c == 'l'){
                i++;
                float l = calculateL(value.charAt(i));
                pt.x -= len * l;
            }
            if(c == 'u'){
                i++;
                float l = calculateL(value.charAt(i));
                pt.y -= len * l;
            }

            if(c == '['){

                // pts.add(pt.clone());
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
