
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Stack;
import java.util.Random;

abstract class System {

    public String axiom;
    public String value;
    public int n;

    Stack<String> stack;
    Random random = new Random();

    ArrayList<Line> lines = new ArrayList();


    // Change to map each character to an ArrayList of strings
    HashMap<Character, ArrayList<String>> rules = new HashMap<Character, ArrayList<String>>();

    public System(String a) {
        this.axiom = a;
        this.value = a;
        this.n = 0;
        stack = new Stack<>();
    }

    // Modified add method to support multiple productions
    protected void add(char k, String str) {
        ArrayList<String> productions = rules.getOrDefault(k, new ArrayList<String>());
        productions.add(str);
        rules.put(k, productions);
    }

    protected void add(String str) {
        String trimStr = str.replace(" ", "");
        String[] parts = trimStr.split("->");
        char tmp = parts[0].charAt(0);

        ArrayList<String> productions = rules.getOrDefault(tmp, new ArrayList<String>());
        productions.add(parts[1]);
        rules.put(tmp, productions);
    }

    String update() {
        stack.push(value);
        StringBuilder newState = new StringBuilder();
        for (int i = 0; i < value.length(); i++) {
            char currentChar = value.charAt(i);
            ArrayList<String> productions = rules.get(currentChar);
            if (productions != null && !productions.isEmpty()) {
                // Select a random production if multiple are available
                String rule = productions.get(random.nextInt(productions.size()));
                newState.append(rule);
            } else if(Character.isDigit(currentChar)){ /// parametric simple solution - would need brackets for something with more oomph
                if (currentChar == '9') {
                    newState.append('0'); // Wrap around if it's '9'
                } else {
                    newState.append((char) (currentChar + 1)); // Increment character by 1
                }
            } else {
                newState.append(currentChar);
            }
        }
        value = newState.toString();
        n++;
        return value;
    }

    void back() {
        
        if (!stack.isEmpty()) {
            value = stack.pop();
            n--;
        }
    }

    public abstract void draw();
    public abstract void populate();
}
