


// Maze maze;
Maze maze;

Housing house = new Housing();

BFS b = new BFS();

int[][] board;


int scale = 1;

int depth = 4;


void setup(){

    size(800,800);
    maze = new Maze(10,10, width - 10, width - 10);
    constructFractal();
    solveMaze(10,10, width - 10, width - 10);
}

void draw(){

    background(0);

    // scale(scale);

    maze.draw();

}

void constructFractal(){
    while(true){
        house = new Housing();

        for(int i = 0; i < depth; i++){
        house.update();
        }

        // house.update();
        // house.update();
        // house.update();

        house.populate();


        board = makeGrid(house.lines, width / scale);

        if(b.isPath(board, maze.start, maze.goal)){
            break;
        } // if a path, end loop;
    }
}

void solveMaze(int x1, int y1, int x2, int y2){
    maze = new Maze(x1, y1, x2, y2);
    maze.lines = house.lines;
    maze.solve(board);
}

void mouseClicked(){

    Point tmp = new Point(mouseX, mouseY);
    
    if(b.isPath(board, maze.start, tmp)){
        solveMaze(maze.start.x, maze.start.y, mouseX, mouseY);
    }
}

void keyPressed(){

    // if(keyCode == UP){
    //     house.percUp();
    //     constructFractal();
    //     solveMaze(10,10, width - 10, width - 10);
    // }

    if(keyCode == 'k' || keyCode == 'K'){
        maze = new Maze(10,10, width - 10, width - 10);
        depth++;
        constructFractal();
        solveMaze(10,10,width - 10, width - 10);
    }

}