


Rasp r = new Rasp();

boolean gol = true;

void setup(){

    size(400,400);

    r.gridForPoints();

}

void draw(){
    background(0);
    r.draw();
}

void keyPressed(){

    if(keyCode == UP){
        r.forward();
        r.mazeSolve();
    }
    if(keyCode == DOWN){
        r.backward();
        r.mazeSolve();
    }
    if(key == 'g' || key == 'G'){
        gol = true;
    }
    if(key == 's' || key == 'S'){
        gol = false;
        println("ja");
    }
}


void mouseClicked(){
    r.click(gol);
}