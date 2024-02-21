


class Rasp {


    public final BFS b = new BFS();

    System sys;
    System tk;

    Maze maze;

    int[][] board;
    int[][] tmg;

    Point goal;
    Point start;

    int k = 1;
    final int maxK = 6;

    boolean toggle = false;

    int rep; // 1 -> House, 2 -> Hillbert
    // int k = 2;

    Rasp(int rep){   
        start = new Point(203,200);
        goal = new Point(205, 200);
        this.rep = rep;
    }

    public void gridForPoints(){
        while(true){
            if(rep == 1){
                this.sys = new Housing();
            }
            if(rep == 2){
                this.sys = new Hilbert();
            }

            for(int i = 0; i < k; i++){
                this.sys.update();  
            }

            this.sys.populate();

            board = makeGrid(sys.lines, width);

            if(b.isPath(board, start, goal)){
                break;
            }
            println("its cooking...");
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

        println(sys.lines.size());
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