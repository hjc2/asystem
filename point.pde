

public class Point {
    int x, y;

    Point(int x, int y) {
        this.x = x;
        this.y = y;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        Point Point = (Point) obj;
        return x == Point.x && y == Point.y;
    }

    @Override
    public int hashCode() {
        return Objects.hash(x, y);
    }
}

public class FPoint {
    float x, y;

    FPoint(float x, float y) {
        this.x = x;
        this.y = y;
    }
}