


// Maze maze;
Maze maze;


void setup(){

    maze = new Maze();

    // println(maze.path.get(0).x);
    size(900,900);

}

void draw(){

    background(255);

    maze.draw();
}