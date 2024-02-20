


// Maze maze;
Maze maze;

Housing house = new Housing();

BFS b = new BFS();

int[][] board;


void setup(){


    size(400,400);

    maze = new Maze(10,10, width - 10, width - 10);

    // house.update();
    // house.update();

    // println("k");

    // house.populate();

    // house.addLine(100,100,300,100);
    // house.addLine(100,100,100,300);
    // house.addLine(300,100,300,300);
    // house.addLine(100,300,300,300);
    // house.addLine(100,50,100,height);

    house.addLine(0,50,50,50);
    // house.addLine(50,0,50,50);

    board = makeGrid(house.lines, width);

    maze.lines = house.lines;


    println(b.isPath(board, maze.start, maze.goal));

    // maze.solve(board);
}

void draw(){

    background(0);

    // scale(2);

    // maze.draw();

}