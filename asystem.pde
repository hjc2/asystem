


// Maze maze;
Maze maze;

Housing house = new Housing();

BFS b = new BFS();

int[][] board;


int scale = 4;

void setup(){


    size(800,800);


    maze = new Maze(10,10, width / scale - 10, width / scale - 10);

    // house.update();
    // house.update();

    house.addLine(0,50,150,50);
    house.addLine(50,100,250,100);

    
    board = makeGrid(house.lines, width / scale);

    maze.lines = house.lines;


    // println(b.isPath(board, maze.start, maze.goal));

    maze.solve(board);
}

void draw(){

    background(0);

    scale(scale);

    maze.draw();

}