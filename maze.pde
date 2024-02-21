



public class Maze {

    ArrayList<Line> lines = new ArrayList();

    List<Point> path;
    private Set<Point> discoveredCells;

    MazeSolver solver;
    Point start;
    Point goal;

    public Maze(){
        this(0,0, 1, 1);
    }

    public Maze(int x1, int y1, int x2, int y2){

        start = new Point(x1, y1);
        goal = new Point(x2, y2);
    }

    public void solve(int[][] grid){
        solver = new MazeSolver(grid);
        
        path = solver.solve(start, goal);
        discoveredCells = solver.discoveredCells;
    }

    public void drawMaze(){
        stroke(140,140,140);
        strokeWeight(1);

        strokeCap(PROJECT);

        for (Line line : lines) {
            noFill();
            line(line.x1, line.y1, line.x2, line.y2);
        }  
    }

    public void drawSolution(){
        strokeWeight(1);
        stroke(0,255,0);

        for(Point p : discoveredCells){
            point(p.x,p.y);
        }

        strokeWeight(3);
        stroke(0,0,255);

        for(Point p : path) {
            point(p.x, p.y);
        }

        strokeWeight(3);
        stroke(255,0,0);
        point(start.x,start.y);
        stroke(255,0,0);
        point(goal.x,goal.y);
    }



    public void addLine(int x1, int y1, int x2, int y2){
        Line l = new Line(x1,y1,x2,y2);
        lines.add(l);
    }

}