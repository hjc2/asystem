

int[][] makeGrid(ArrayList<Line> lines, int width){

    int GRID_SIZE = width;
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

    return(grid);

}