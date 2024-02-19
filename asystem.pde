


// Maze maze;
Maze maze;


void setup(){

    maze = new Maze(50,50, 750, 750);

    // println(maze.path.get(0).x);
    size(800,800);
    maze.add(100,100,25,25);

    maze.add(-10,100,100,25);

    maze.solve();

}

void draw(){

    background(255);

    maze.draw();
}