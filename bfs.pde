// A simple Point class to represent positions on the grid

BFS bfs;

class BFS {
  BFS() {
  }
  
  // Check if a given cell (row, col) can be included in BFS
  private boolean isValid(int[][] grid, boolean[][] visited, int row, int col) {
    // Grid dimensions
    int ROW = grid.length;
    int COL = grid[0].length;
    
    // Check if row and col are in range and cell is not blocked and not visited
    return (row >= 0) && (row < ROW) &&
           (col >= 0) && (col < COL) &&
           (grid[row][col] == 1) && (!visited[row][col]);
  }
  
  // Function to check if there is a path from start point to end point
  public boolean isPath(int[][] grid, Point start, Point end) {
    if (grid[start.x][start.y] == 0 || grid[end.x][end.y] == 0) {
      return false; // Start or end is blocked
    }
    
    // Grid dimensions
    int ROW = grid.length;
    int COL = grid[0].length;
    
    // Visited array to keep track of visited cells
    boolean[][] visited = new boolean[ROW][COL];
    
    // Possible moves in the grid (up, down, left, right)
    int[] rowNum = {-1, 0, 0, 1};
    int[] colNum = {0, -1, 1, 0};
    
    // Queue to hold the cells to be explored in BFS
    LinkedList<Point> queue = new LinkedList<>();
    
    // Mark the starting cell as visited and enqueue it
    visited[start.x][start.y] = true;
    queue.add(start);
    
    while (!queue.isEmpty()) {
      Point curr = queue.poll();
      
      // If we have reached the end point, return true
      if (curr.x == end.x && curr.y == end.y) {
        return true;
      }
      
      // Explore all four possible movements from current cell
      for (int i = 0; i < 4; i++) {
        int row = curr.x + rowNum[i];
        int col = curr.y + colNum[i];
        
        if (isValid(grid, visited, row, col)) {
          visited[row][col] = true;
          queue.add(new Point(row, col));
        }
      }
    }
    
    // Return false if there is no path from start to end
    return false;
  }
}
