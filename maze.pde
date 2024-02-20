



public class Maze {

    // List<int[]> rectangles = Arrays.asList(new int[]{-2,-2,1,1});

    ArrayList<Rectangle> rectangles = new ArrayList();
    ArrayList<Line> lines = new ArrayList();

    List<Point> path;
    MazeSolver solver;
    Point start;
    Point goal;

    public Maze(){
        this(0,0, width - 1, height - 1);
    }

    public Maze(int x1, int y1, int x2, int y2){

        // Rectangle tmp = new Rectangle(200,200,400,400);
        // rectangles.add(tmp);

        start = new Point(x1, y1);
        goal = new Point(x2, y2);
    }

    public void solve(){
        solver = new MazeSolver(rectangles, lines, width);
        path = solver.solve(start, goal);
    }

    public void draw(){
    
        rectMode(CORNER);
        stroke(0);
        strokeWeight(3);

        for (Rectangle rect : rectangles) {
            noFill();
            rect(rect.x, rect.y, rect.w, rect.h);
        }  

        strokeWeight(1);
        stroke(120,255,120);
        for (Point p : solver.discoveredCells) {
            point(p.x, p.y);
        }

        strokeWeight(3);
        stroke(0,0,255);

        for(Point p : path) {
            point(p.x, p.y);
        }

        strokeWeight(6);
        stroke(255,0,0);
        point(goal.x,goal.y);
    }

    public void add(int x, int y, int w, int h){
        Rectangle tmp = new Rectangle(x,y,w,h);
        rectangles.add(tmp);
    }

    public void add(Rectangle r){
        rectangles.add(r);
    }

    public void addLine(int x1, int y1, int x2, int y2){
        Line l = new Line(x1,y1,x2,y2);
        lines.add(l);
    }

}