
import java.util.*;



import java.util.*;

public class MazeSolver {
    private static final int GRID_SIZE = 800;
    private int[][] grid = new int[GRID_SIZE][GRID_SIZE];
    private Set<Pointed> discoveredCells = new HashSet<>(); // Track discovered cells

    public MazeSolver(List<int[]> rectangles) {
        for (int[] rect : rectangles) {
            int x = rect[0], y = rect[1], width = rect[2], height = rect[3];
            for (int i = x; i < x + width && i < GRID_SIZE; i++) {
                for (int j = y; j < y + height && j < GRID_SIZE; j++) {
                    grid[i][j] = 1; // Mark as blocked
                }
            }
        }
    }

    public List<Pointed> solve(Pointed start, Pointed goal) {
        Map<Pointed, Pointed> cameFrom = new HashMap<>();
        Map<Pointed, Integer> costSoFar = new HashMap<>();
        PriorityQueue<Pointed> frontier = new PriorityQueue<>(Comparator.comparingInt(p -> costSoFar.get(p) + heuristic(p, goal)));
        frontier.add(start);
        cameFrom.put(start, null);
        costSoFar.put(start, 0);
        discoveredCells.add(start); // Add start to discovered cells

        while (!frontier.isEmpty()) {
            Pointed current = frontier.poll();

            if (current.equals(goal)) {
                break;
            }

            for (Pointed next : getNeighbors(current)) {
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
        for (Pointed p : discoveredCells) {
            System.out.println(p.x + "," + p.y);
        }
    }

    // Other methods remain the same..


    private List<Pointed> getNeighbors(Pointed current) {
        List<Pointed> neighbors = new ArrayList<>();
        int[][] directions = {{0, 1}, {1, 0}, {0, -1}, {-1, 0}}; // 4-directional movement

        for (int[] dir : directions) {
            int nx = current.x + dir[0], ny = current.y + dir[1];
            if (nx >= 0 && nx < GRID_SIZE && ny >= 0 && ny < GRID_SIZE && grid[nx][ny] == 0) {
                neighbors.add(new Pointed(nx, ny));
            }
        }

        return neighbors;
    }

    private int heuristic(Pointed a, Pointed b) {
        return Math.abs(a.x - b.x) + Math.abs(a.y - b.y);
    }

    private List<Pointed> reconstructPath(Map<Pointed, Pointed> cameFrom, Pointed start, Pointed goal) {
        LinkedList<Pointed> path = new LinkedList<>();
        Pointed current = goal;
        while (!current.equals(start)) {
            path.addFirst(current);
            current = cameFrom.get(current);
        }
        path.addFirst(start);
        return path;
    }

}


