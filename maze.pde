



public class Maze {

    // List<int[]> rectangles = Arrays.asList(new int[]{-2,-2,1,1});

    ArrayList<Rectangle> rectangles = new ArrayList();

    List<Point> path;
    MazeSolver solver;
    Point start;
    Point goal;

    public Maze(){

        // println("i ran!");

        // rectangles = Arrays.asList(new int[]{100, 100, 200, 200}, new int[]{400, 400, 100, 100}, new int[]{500,0,10,400}, new int[]{600,400,20,400});

        // rectangles = Arrays.asList();

        // rectangles.append(new int[]{200,200,400,400});

        Rectangle tmp = new Rectangle(200,200,400,400);
        rectangles.add(tmp);

        solver = new MazeSolver(rectangles);
        start = new Point(0, 0);
        goal = new Point(799, 799);
        path = solver.solve(start, goal);

    }
    public void draw(){
    
        rectMode(CORNER);
        stroke(0);
        strokeWeight(3);

        for (Rectangle rect : rectangles) {
            rect(rect.x, rect.y, rect.w, rect.h);
        }  

        strokeWeight(1);
        stroke(120,255,120);
        for (Point p : solver.discoveredCells) {
            point(p.x, p.y);
        }

        strokeWeight(5);
            stroke(0,0,255);
        for(Point p : path) {
            point(p.x, p.y);
        }

        strokeWeight(6);
        stroke(255,0,255);
        point(800,800);
    }

}