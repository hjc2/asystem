int[][] makeGrid(ArrayList<Line> lines, int pw){

    int GRID_SIZE = pw;
    int[][] grid = new int[GRID_SIZE][GRID_SIZE];

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

        // Handling horizontal lines
        if(y1 == y2){
            for(int i = Math.min(x1, x2); i <= Math.max(x1, x2); i++){
                grid[i][y1] = 1;
            }
        }

        // Handling vertical lines
        else if(x1 == x2){
            for(int i = Math.min(y1, y2); i <= Math.max(y1, y2); i++){
                grid[x1][i] = 1;
            }
        }

        // Handling perfectly diagonal lines
        else if(Math.abs(x1 - x2) == Math.abs(y1 - y2)){
            int xStep = x1 < x2 ? 1 : -1;
            int yStep = y1 < y2 ? 1 : -1;
            int length = Math.abs(x1 - x2);
            for(int i = 0; i <= length; i++){
                grid[x1 + i*xStep][y1 + i*yStep] = 1;
            }
        }
    }

    return(grid);
}
