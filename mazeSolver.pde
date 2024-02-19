



import java.util.*;

public class MazeSolver {
    private int GRID_SIZE;
    private int[][] grid;
    private Set<Point> discoveredCells = new HashSet<>(); // Track discovered cells

    public MazeSolver(ArrayList<Rectangle> rectangles, int width) {

        GRID_SIZE = width;

        grid = new int[GRID_SIZE][GRID_SIZE];
        
        for (Rectangle rect : rectangles) {
            int x = rect.x, y = rect.y, w = rect.w, h = rect.h;
            for (int i = x; i < x + w && i < GRID_SIZE; i++) {
                for (int j = y; j < y + h && j < GRID_SIZE; j++) {
                    int a = i;
                    int b = j;
                    if(a < 0){
                        a = 0;
                    }
                    if(a >= GRID_SIZE){
                        a = GRID_SIZE - 1;
                    }
                    if(b < 0){
                        b = GRID_SIZE;
                    }
                    if(b >= GRID_SIZE){
                        b = GRID_SIZE - 1;
                    }
                    grid[a][b] = 1; // Mark as blocked
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

    // Method to print discovered cells
    private void printDiscoveredCells() {
        for (Point p : discoveredCells) {
            System.out.println(p.x + "," + p.y);
        }
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

}


