

    public class Pointed {
        int x, y;

        Pointed(int x, int y) {
            this.x = x;
            this.y = y;
        }

        @Override
        public boolean equals(Object obj) {
            if (this == obj) return true;
            if (obj == null || getClass() != obj.getClass()) return false;
            Pointed Pointed = (Pointed) obj;
            return x == Pointed.x && y == Pointed.y;
        }

        @Override
        public int hashCode() {
            return Objects.hash(x, y);
        }
    }