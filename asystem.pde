




void setup(){

    size(800,800);

    List<int[]> rectangles = Arrays.asList(new int[]{100, 100, 200, 200}, new int[]{400, 400, 100, 100});
    MazeSolver solver = new MazeSolver(rectangles);
    Pointed start = new Pointed(0, 0);
    Pointed goal = new Pointed(799, 799);
    List<Pointed> path = solver.solve(start, goal);
    System.out.println("Path found: " + path.stream().limit(100).map(p -> String.format("(%d, %d)", p.x, p.y)).toList());

}



