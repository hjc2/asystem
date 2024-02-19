


 List<int[]> rectangles;
 List<Pointed> path;
 MazeSolver solver;


void setup(){

    size(900,900);

    rectangles = Arrays.asList(new int[]{100, 100, 200, 200}, new int[]{400, 400, 100, 100}, new int[]{500,0,10,400}, new int[]{600,400,20,400});
    solver = new MazeSolver(rectangles);
    Pointed start = new Pointed(0, 0);
    Pointed goal = new Pointed(799, 799);
    path = solver.solve(start, goal);

    for(int i = 0; i < 20; i++){
        println(path.get(i).x + ", " + path.get(i).y);
    }

    print(rectangles.get(0)[0]);
}

void draw(){

    background(255);
    rectMode(CORNER);
    stroke(0);
    strokeWeight(3);


    for (int[] rect : rectangles) {
        rect(rect[0], rect[1], rect[2], rect[3]);
    }        


    strokeWeight(1);
    stroke(120,255,120);
    for (Pointed p : solver.discoveredCells) {
        point(p.x, p.y);
    }

    strokeWeight(5);
        stroke(0,0,255);
    for(Pointed p : path) {
        point(p.x, p.y);
    }

    strokeWeight(6);
    stroke(255,0,255);
    point(800,800);
}