


// Maze maze;
Maze maze;

Housing house = new Housing();

BFS b = new BFS();

int[][] board;


int scale = 1;

void setup(){


    size(400,400);


    maze = new Maze(10,10, width / scale - 10, width / scale - 10);


    while(true){
        house = new Housing();

        house.update();
        house.update();
        house.update();
        // house.update();

        house.populate();

        board = makeGrid(house.lines, width / scale);

        if(b.isPath(board, maze.start, maze.goal)){
            break;
        } // if a path, end loop;
    }



    maze.lines = house.lines;


    maze.solve(board);
}

void draw(){

    background(0);

    // scale(scale);

    maze.draw();

}