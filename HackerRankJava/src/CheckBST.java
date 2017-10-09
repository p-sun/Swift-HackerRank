// https://www.hackerrank.com/challenges/ctci-is-binary-search-tree/problem
// Check to see if a Node is the root of a binary tree.

// A binary tree is defined as:
// The  value of every node in a node's left subtree is less than the data value of that node.
// The  value of every node in a node's right subtree is greater than the data value of that node.

class Node {
    int data;
    Node left;
    Node right;
    
    Node(int data, Node left, Node right) {
        this.data = data;
        this.left = left;
        this.right = right;
    }
}

public class CheckBST {
    // Solution
    boolean checkBST(Node root) {
        return _checkBST(root, Integer.MIN_VALUE, Integer.MAX_VALUE);
    }

    private boolean _checkBST(Node node, int min, int max) {
        if (node == null) {
            return true;
        }

        // Current node's data must always be between min and max.
        if (node.data < min || node.data > max) {
            return false;
        }

        // Recursively shrink the boundaries of min and max of each node.
        int data = node.data;
        return _checkBST(node.left, min, data - 1)
                && _checkBST(node.right, data + 1, max);
    }

    // Test Cases
    public static void main(String[] args) {
        CheckBST instance = new CheckBST();
        instance.run();
    }

    void run() {
        Node singleNode = new Node(4, null, null);
        System.out.println(checkBST(singleNode)); // true
        print(singleNode);

        Node tree = new Node(4,
                new Node(2,
                        new Node(1, null, null),
                        new Node(3, null, null)),
                new Node(6,
                        new Node(5, null, null),
                        new Node(7, null, null)));
        System.out.println(checkBST(tree)); // true
        print(tree);

        Node notBinaryTree = new Node(4,
                new Node(2,
                        new Node(1, null, null),
                        new Node(3, null, null)),
                new Node(6,
                        new Node(5,
                                new Node(4, null, null),
                                null),
                        new Node(7, null, null)));
        System.out.println(checkBST(notBinaryTree)); // false
        print(notBinaryTree);

        Node repeatValueTree = new Node(4,
                new Node(6,
                        new Node(4, null, null),
                        null),
                new Node(4,null, null));
        System.out.println(checkBST(repeatValueTree)); // false
        print(repeatValueTree);

        Node inOrder = new Node(1,
                new Node(2, null, null),
                new Node(3,null, null));
        System.out.println(checkBST(inOrder)); // false
        print(inOrder);
    }

    // Print a Node - Extra Helper for debugging on HackerRank
    void print(Node root) {
        String string = toString(root, new StringBuilder(), true, new StringBuilder()).toString();
        System.out.println(string);
    }

    private StringBuilder toString(Node root, StringBuilder prefix, boolean isTail, StringBuilder sb) {
        if(root.right!=null) {
            toString(root.right, new StringBuilder().append(prefix).append(isTail ? "│   " : "    "), false, sb);
        }
        sb.append(prefix).append(isTail ? "└── " : "┌── ").append(root.data).append("\n");
        if(root.left!=null) {
            toString(root.left, new StringBuilder().append(prefix).append(isTail ? "    " : "│   "), true, sb);
        }
        return sb;
    }
}
