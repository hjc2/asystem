


class Rasp {


    public final BFS b = new BFS();

    System sys;
    System tk;

    Maze maze;

    int[][] board;
    int[][] tmg;

    Point goal;
    Point start;

    int k = 2;
    final int maxK = 6;

    boolean toggle = false;
    // int k = 2;

    Rasp(){   
        start = new Point(5,5);
        goal = new Point(395, 395);
    }

    public void gridForPoints(){
        while(true){
            this.sys = new Housing();

            for(int i = 0; i < 2; i++){
                this.sys.update();  
            }

            this.sys.populate();

            board = makeGrid(sys.lines, width);

            if(b.isPath(board, start, goal)){
                break;
            }
        }
        this.mazeSolve();
    }

    public void draw(){
        maze.drawMaze();
        maze.drawSolution();
    };

    public void mazeSolve(){
        maze = new Maze(start.x, start.y, goal.x, goal.y);
        maze.lines = sys.lines;
        maze.solve(board);
    }

    public void forward(){

        int q = 0;
        while(true && k < maxK && q <= 40 ){

            sys.update();
            sys.populate();

           tmg = makeGrid(sys.lines, width);
            
            if(b.isPath(tmg,start,goal)){   
                board = tmg;
                k++;
                break;
            }

            sys.back();
            q++;
        }

    }

    public void backward(){
        sys.back();
        sys.populate();

        board = makeGrid(sys.lines, width);
        k--;
    }

    public void click(boolean gol){
        Point tmp = new Point(mouseX, mouseY);

        if(gol){
            if(b.isPath(board,start,tmp)){
                goal = tmp;
                mazeSolve();
            }
        } else {
            if(b.isPath(board,tmp,start)){
                start = tmp;
                mazeSolve();
            }
        }

    }

}