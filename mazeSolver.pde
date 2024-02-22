import java.util.*;

public class MazeSolver {
    private int[][] grid;
    private int gridSize;
    private Map<Point, Integer> costSoFar = new HashMap<>();

    public MazeSolver(int[][] grid) {
        this.grid = grid;
        this.gridSize = grid.length;
    }

    public List<Point> solve(Point start, Point goal) {
        PriorityQueue<Point> frontier = new PriorityQueue<>(Comparator.comparingInt(costSoFar::get));
        frontier.add(start);
        costSoFar.put(start, 0);

        Map<Point, Point> cameFrom = new HashMap<>();
        cameFrom.put(start, null);

        while (!frontier.isEmpty()) {
            Point current = frontier.poll();

            if (current.equals(goal)) {
                return reconstructPath(cameFrom, start, goal);
            }

            for (Point next : getNeighbors(current)) {
                int newCost = costSoFar.get(current) + 1;
                if (!costSoFar.containsKey(next) || newCost < costSoFar.get(next)) {
                    costSoFar.put(next, newCost);
                    frontier.add(next);
                    cameFrom.put(next, current);
                }
            }
        }

        return Collections.emptyList(); // Return an empty path if goal is not reachable
    }

    private List<Point> getNeighbors(Point current) {
        List<Point> neighbors = new ArrayList<>();
        int[] directions = {-1, 0, 1, 0, -1}; // For traversing left, up, right, down

        for (int i = 0; i < 4; i++) {
            int newX = current.x + directions[i];
            int newY = current.y + directions[i + 1];

            if (newX >= 0 && newX < gridSize && newY >= 0 && newY < gridSize && grid[newX][newY] == 0) { // Assuming 0 is a free space
                neighbors.add(new Point(newX, newY));
            }
        }

        return neighbors;
    }

    private List<Point> reconstructPath(Map<Point, Point> cameFrom, Point start, Point goal) {
        List<Point> path = new ArrayList<>();
        for (Point at = goal; at != null; at = cameFrom.get(at)) {
            path.add(at);
        }
        Collections.reverse(path);
        return path;
    }
}
