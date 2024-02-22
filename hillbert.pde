


class Hilbert extends System {

    float basis = 20.0;
    FPoint pt = new FPoint(basis, basis);


    int mode = 0;
    // 0 right
    // 1 down
    // 2 left
    // 3 right

     

    Hilbert(){
        // basis = bas;
        super("A");

        this.add("A -> +BF-AFA-FB+");
        this.add("B -> -AF+BFB+FA-");

    }

    public void populate(){

        mode = 0;
        lines = new ArrayList();

        for(int i=0; i<value.length(); i++) {

            char c = value.charAt(i);
            
            float len = (height - (basis * 2)) / (pow(2,n) - 1);

            // println("len " + str(len));

            if(c == '+'){
                this.plus();
            }
            if(c == '-'){
                this.minus();
            }

            if(c == 'F'){
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

        }

         pt = new FPoint(basis, basis);

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
