


// Maze maze;
Maze maze;

Housing house = new Housing();



void setup(){


    size(400,400);

    maze = new Maze(50,50, 350, 350);

    // maze.add(100,100,25,25);

    // maze.add(-10,100,100,25);

    house.update();
    house.update();
    house.update();
    house.update();
    house.update();

    house.populate();
    
    println(house.rects.size());
    for(Rectangle r : house.rects){

        maze.add(r);

        println(r.x);
    }
    maze.solve();

}

void draw(){

    background(255);

    maze.draw();

    // house.draw();
}