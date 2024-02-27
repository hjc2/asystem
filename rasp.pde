


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
    int maxK = 6;

    int maxQ;

    boolean toggle = false;

    int rep; // 1 -> House, 2 -> Hillbert
    // int k = 2;

    Rasp(int rep){   
        start = new Point(45,45);
        // goal = new Point(width - 10, height - 20);
        // goal = new Point(width - 10, height - 20);
        goal = new Point(width - 45,height - 45);
        this.rep = rep;
    }

    public void gridForPoints(){
        boolean right = true;
        
        while(true){
            if(rep == 1){
                this.sys = new Housing();
                maxK = 7;
                maxQ = 40;
            }
            if(rep == 2){
                this.sys = new Hilbert();
                maxK = 7;
                maxQ = 1;
            }
            if(rep == 3){
                this.sys = new Koch();
                maxK = 50;
                maxQ = 2;
            }

            for(int i = 0; i < k; i++){
                this.sys.update();  
            }

            this.sys.populate();

            board = makeGrid(sys.lines, width);

            if(b.isPath(board, start, goal)){
                break;
            }

            if(this.goal.x < width - 5){
                this.goal.x += 4;
            }
            if(this.goal.x < width - 5){
                this.goal.x -= 1;
            }
            if(this.goal.y < height - 5){
                this.goal.y += 4;
            }
            if(this.goal.y > height - 5){
                this.goal.y -= 1;
            }

            if(this.start.x < width - 5){
                this.start.x += 4;
            }
            if(this.start.x < width - 5){
                this.start.x -= 1;
            }
            if(this.start.y < height - 5){
                this.start.y += 4;
            }
            if(this.start.y > height - 5){
                this.start.y -= 1;
            }

            println("its cooking...");
        }
        this.mazeSolve();
    }

    public void draw(){
        maze.drawMaze();
        // this.drawReal();
        maze.drawSolution();
    };

    public void drawDiscover(){
        maze.drawDiscover();
    }

    public void mazeSolve(){
        maze = new Maze(start.x, start.y, goal.x, goal.y);
        maze.lines = sys.lines;
        maze.solve(board);
    }

    public void forward(){

        int q = 0;
        while(true && k < maxK && q <= maxQ ){

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

        // println(k);

    }

    public void backward(){
        sys.back();
        sys.populate();

        board = makeGrid(sys.lines, width);
        k--;

        // println(sys.lines.size());
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

    public void drawReal(){
        stroke(255);
        strokeWeight(1);

        for(int i = 0; i < width; i++){
            for(int j = 0; j < width; j++){
                if(board[i][j] == 1){
                    point(i,j);
                }
            }
        }
    }
}