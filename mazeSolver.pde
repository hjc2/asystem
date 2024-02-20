



import java.util.*;

public class MazeSolver {
    private int GRID_SIZE;
    private int[][] grid;
    private Set<Point> discoveredCells = new HashSet<>(); // Track discovered cells

    public MazeSolver(ArrayList<Line> lines, int width) {

        GRID_SIZE = width;

        grid = new int[GRID_SIZE][GRID_SIZE];
        
        for(Line line : lines){
            
            int x1 = line.x1;
            x1 = x1 >= GRID_SIZE ? GRID_SIZE - 1 : x1;
            x1 = x1 < 0 ? 0 : x1;

            int y1 = line.y1;
            y1 = y1 >= GRID_SIZE ? GRID_SIZE - 1 : y1;
            y1 = y1 < 0 ? 0 : y1;

            int x2 = line.x2;
            x2 = x2 >= GRID_SIZE ? GRID_SIZE - 1 : x2;
            x2 = x2 < 0 ? 0 : x2;

            int y2 = line.y2;
            y2 = y2 >= GRID_SIZE ? GRID_SIZE - 1 : y2;
            y2 = y2 < 0 ? 0 : y2;

            if(y1 == y2){
                for(int i = x1; i <= x2; i++){
                    grid[i][y1] = 1;
                }
                for(int i = x2; i <= x1; i++){
                    grid[i][y1] = 1;
                }
            }

            if(x1 == x2){
                for(int i = y1; i <= y2; i++){
                    grid[x1][i] = 1;
                }
                for(int i = x2; i <= x1; i++){
                    grid[x1][i] = 1;
                }
            }

        }
    }

    public List<Point> solve(Point start, Point goal) {
        Map<Point, Point> cameFrom = new HashMap<>();
        Map<Point, Integer> costSoFar = new HashMap<>();
        PriorityQueue<Point> frontier = new PriorityQueue<>(Comparator.comparingInt(p -> costSoFar.get(p) + heuristic(p, goal)));
        frontier.add(start);
        cameFrom.put(start, null);
        costSoFar.put(start, 0);
        discoveredCells.add(start); // Add start to discovered cells

        while (!frontier.isEmpty()) {
            Point current = frontier.poll();

            if (current.equals(goal)) {
                break;
            }

            for (Point next : getNeighbors(current)) {
                int newCost = costSoFar.get(current) + 1;
                if (!costSoFar.containsKey(next) || newCost < costSoFar.get(next)) {
                    costSoFar.put(next, newCost);
                    frontier.add(next);
                    cameFrom.put(next, current);
                    discoveredCells.add(next); // Add next to discovered cells
                }
            }
        }

        // printDiscoveredCells(); // Optionally print discovered cells
        return reconstructPath(cameFrom, start, goal);
    }


    // Other methods remain the same..


    private List<Point> getNeighbors(Point current) {
        List<Point> neighbors = new ArrayList<>();
        int[][] directions = {{0, 1}, {1, 0}, {0, -1}, {-1, 0}}; // 4-directional movement

        for (int[] dir : directions) {
            int nx = current.x + dir[0], ny = current.y + dir[1];
            if (nx >= 0 && nx < GRID_SIZE && ny >= 0 && ny < GRID_SIZE && grid[nx][ny] == 0) {
                neighbors.add(new Point(nx, ny));
            }
        }

        return neighbors;
    }

    private int heuristic(Point a, Point b) {
        return Math.abs(a.x - b.x) + Math.abs(a.y - b.y);
    }

    private List<Point> reconstructPath(Map<Point, Point> cameFrom, Point start, Point goal) {
        LinkedList<Point> path = new LinkedList<>();
        Point current = goal;
        while (!current.equals(start)) {
            path.addFirst(current);
            current = cameFrom.get(current);
        }
        path.addFirst(start);
        return path;
    }

    public void draw(){
        for(int i = 0; i < GRID_SIZE; i++){
            for(int j = 0; j < GRID_SIZE; j++){
                // println(i + " " + j);

                if(grid[i][j] == 0){
                    stroke(255);
                }
                if(grid[i][j] == 1){
                    stroke(0);
                }
                strokeWeight(1);
                point(i,j);
            }
        }
    }
}


