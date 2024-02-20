


// Maze maze;
Maze maze;

Housing house = new Housing();



void setup(){


    size(400,400);

    maze = new Maze(50,50, 350, 350);

    house.update();
    house.update();

    println("k");

    house.populate();

    // house.addLine(100,100,300,100);
    // house.addLine(100,100,100,300);
    // house.addLine(300,100,300,300);
    // house.addLine(100,300,300,300);

    // println(maze.lines.size());

    maze.lines = house.lines;
    println(maze.lines.size());

    maze.solve();

}

void draw(){

    background(0);

    // scale(2);

    maze.draw();

}