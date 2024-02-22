

int rval = 2;

int maxVal = 2;

Rasp r = new Rasp(rval);

boolean disc = true;

boolean gol = true;

void setup(){

    size(800,800);

    r.gridForPoints();

}

void draw(){
    background(0);

    if(disc){ r.drawDiscover();}

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
    }

    if(key == 't' || key == 'T'){
        if(rval >= maxVal){
            rval = 1;
        } else {
            rval++;
        }
        r = new Rasp(rval);
        r.gridForPoints();
        println(rval);
    } 

    if(key == 'd' || key == 'D'){
        disc = !disc;
    }

}


void mouseClicked(){

    r.click(gol);

}