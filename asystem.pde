


// Maze maze;
Maze maze;

Housing house = new Housing();



void setup(){


    size(400,400);

    maze = new Maze(50,50, 350, 350);

    house.update();
    house.update();
    house.update();
    house.update();

    house.populate();

    // println(maze.lines.size());
    maze.lines = house.lines;
        println(maze.lines.size());

    maze.solve();

}

void draw(){

    background(255);

    maze.draw();
    // translate(200,0);

    // rect(0,0,300,300);

}