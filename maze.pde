



public class Maze {

    ArrayList<Line> lines = new ArrayList();

    List<Point> path;
    MazeSolver solver;
    Point start;
    Point goal;

    public Maze(){
        this(0,0, width - 1, height - 1);
    }

    public Maze(int x1, int y1, int x2, int y2){

        start = new Point(x1, y1);
        goal = new Point(x2, y2);
    }

    public void solve(int[][] grid){
        solver = new MazeSolver(grid, width);
        
        path = solver.solve(start, goal);
    }

    public void draw(){
    
        rectMode(CORNER);
        stroke(80,80,80);
        strokeWeight(3);

        for (Line line : lines) {
            noFill();
            line(line.x1, line.y1, line.x2, line.y2);
        }  

        // strokeWeight(1);
        // stroke(255,255,255);

        // for(Point p : solver.discoveredCells){
        //     point(p.x,p.y);
        // }

        strokeWeight(1);
        stroke(0,0,255);

        for(Point p : path) {
            point(p.x, p.y);
        }

        strokeWeight(6);
        stroke(255,0,0);
        point(goal.x,goal.y);
    }



    public void addLine(int x1, int y1, int x2, int y2){
        Line l = new Line(x1,y1,x2,y2);
        lines.add(l);
    }

    public void drawGrid(){
        solver.draw();
    }
    

}