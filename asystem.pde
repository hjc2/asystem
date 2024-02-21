


// Maze maze;
Maze maze;

Housing house = new Housing();

Hilbert hilbert = new Hilbert();

BFS b = new BFS();

int[][] board;


int scale = 1;

Point start;
Point goal;

void setup(){

// println(width);

    size(800,800);

    start = new Point(5,385);
    goal = new Point(20, 385);

    // constructFractal();

    hilbert.update();
    hilbert.update();
    hilbert.update();
    hilbert.update();    
    hilbert.update();
    // hilbert.update();

    // hilbert.update();

    hilbert.populate();

    board = makeGrid(hilbert.lines, width / scale);

    maze = new Maze(start.x, start.y, goal.x, goal.y);


    println(hilbert.lines.size());


}

void draw(){

    background(0);

    // scale(scale);

    solveMaze(maze.start.x, maze.start.y, maze.goal.x, maze.goal.y);

    maze.draw();
    // for (Line line : hilbert.lines) {
    //     stroke(255);
    //     noFill();
    //     line(line.x1, line.y1, line.x2, line.y2);
    // }  
}

void constructFractal(){

    while(true){
        house = new Housing();

        house.update();
        house.update();
        house.update();
        house.update();
        house.update();
        house.update();
        house.update();

        house.populate();


        board = makeGrid(house.lines, width / scale);


        if(b.isPath(board, start, goal)){
            break;
        }

    }




}

void solveMaze(int x1, int y1, int x2, int y2){
    maze = new Maze(x1, y1, x2, y2);
    maze.lines = hilbert.lines;
    maze.solve(board);
}

void mouseClicked(){

    Point tmp = new Point(mouseX, mouseY);
    
    if(b.isPath(board, maze.start, tmp)){
        solveMaze(maze.start.x, maze.start.y, mouseX, mouseY);
    }
}