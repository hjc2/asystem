




class Koch extends System {

    FPoint pt = new FPoint(width / 2.0, height / 2.0);
    Stack<FPoint> pts;
    Stack<Integer> smoke;
    int mode = 0;

    Koch(){

        // super("[F][F][F][F][F][F][F][F]");
        super("[F][F][F][F][F][F][F][F]");

        this.add("F -> fL");
        this.add("F -> fR");
        this.add("F -> fS");
        this.add("F -> fF");
        this.add("F -> fF");
        this.add("F -> fF");

        this.add("L -> lL");
        this.add("L -> lR");
        this.add("L -> lS");
        this.add("L -> lF");
        this.add("L -> lF");
        this.add("L -> lF");

        this.add("R -> rL");
        this.add("R -> rR");
        this.add("R -> rS");
        this.add("R -> rF");
        this.add("R -> rF");
        this.add("R -> rF");

        this.add("S -> sL");
        this.add("S -> sR");
        this.add("S -> sS");
        this.add("S -> sF");
        this.add("S -> sF");
        this.add("S -> sF");

        // skips
        // right
        // left
        // forward
        pts = new Stack<>();
        smoke = new Stack<>();
        pts.push(pt);
        
    }


    public void populate(){

        lines = new ArrayList();

        for(int i=0; i<value.length(); i++) {

            char c = value.charAt(i);
            
            float len = (height) / 25;

            if(c == 'R' || c == 'r'){
                this.plus();
            }
            if(c == 'L' || c == 'l'){
                this.minus();
            }
        
            if(c == 'F' || c == 'f'){
                if(mode == 0){
                    addLine(pt.x,pt.y,pt.x + len, pt.y);
                    pt.x += len;
                }
                if(mode == 1){
                    addLine(pt.x,pt.y,pt.x, pt.y + len);
                    pt.y += len;
                }
                if(mode == 2){
                    addLine(pt.x - len,pt.y,pt.x, pt.y);
                    pt.x -= len;
                }
                if(mode == 3){
                    addLine(pt.x,pt.y - len,pt.x, pt.y);
                    pt.y -= len;
                }
            }

            if(c == 'S' || c == 's'){
                if(mode == 0){
                    pt.x += len;
                }
                if(mode == 1){
                    pt.y += len;
                }
                if(mode == 2){
                    pt.x -= len;
                }
                if(mode == 3){
                    pt.y -= len;
                } 
            }

            if(c == '['){

                pts.add(pt.clone());
                smoke.add(mode);
                // pts.add(pt);
            }
            if(c == ']'){
                pt = pts.pop();
                mode = smoke.pop();
            }
        }

        pt = new FPoint(width / 2.0, height / 2.0);
        mode = 0;
    }
    public void draw(){}

    public void addLine(int x1, int y1, int x2, int y2){
        Line tmp = new Line(x1,y1,x2,y2);
        lines.add(tmp);
    }
    public void addLine(float x1, float y1, float x2, float y2){
        Line tmp = new Line(int(x1),int(y1),int(x2),int(y2));
        lines.add(tmp);
    }
    public void plus(){
        if(mode >= 3){
            mode = 0;
        } else {
            mode++;
        }
    }

    public void minus(){
        if(mode <= 0){
            mode = 3;
        } else {
            mode--;
        }
    }
}