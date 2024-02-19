



public class Maze {

    List<int[]> rectangles;
    List<Point> path;
    MazeSolver solver;

    public void Maze(){

        println("i ran!");

        rectangles = Arrays.asList(new int[]{100, 100, 200, 200}, new int[]{400, 400, 100, 100}, new int[]{500,0,10,400}, new int[]{600,400,20,400});
        solver = new MazeSolver(rectangles);
        Point start = new Point(0, 0);
        Point goal = new Point(799, 799);
        path = solver.solve(start, goal);

        println("i also ran!");


    }
    public void draw(){
        rectMode(CORNER);
        stroke(0);
        strokeWeight(3);


        for (int[] rect : rectangles) {
            rect(rect[0], rect[1], rect[2], rect[3]);
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