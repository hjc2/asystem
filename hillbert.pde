


class Hilbert extends System {


    FPoint pt = new FPoint(0.0,0.0);


    int mode = 0;
    
     

    Hilbert(){

        super("A");

        this.add("A -> +BF-AFA-FB+");
        this.add("B -> -AF+BFB+FA-");

    }

    public void populate(){

        lines = new ArrayList();

        for(int i=0; i<value.length(); i++) {

            char c = value.charAt(i);
            
            float len = (height) / pow(2,n);

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
