public class BinarySearch {
    public static void main(String[] args) {
        BinarySearch instance = new BinarySearch();
        instance.run();
    }

    void run() {

        System.out.println("Running tests...");

        test(binarySearch(new int[] {1, 2, 4, 5}, 4) == 2);

        test(binarySearch(new int[] {1, 2, 4, 5, 8}, 4) == 2);

        test(binarySearch(new int[] {1}, 4) == -1);

        test(binarySearch(new int[] {7}, 7) == 0);

        test(binarySearch(new int[] {7, 8}, 7) == 0);

        test(binarySearch(new int[] {7, 8}, 8) == 1);

        test(binarySearch(new int[] {4, 5, 6}, 8) == -1);

        test(binarySearch(new int[] {4, 5, 6}, 4) == 0);

        test(binarySearch(new int[] {4, 5, 6}, 5) == 1);

        test(binarySearch(new int[] {4, 5, 6}, 6) == 2);
    }

    void test(Boolean b) {
        if (b) {
            System.out.print("OK! ");
        } else {
            System.out.println("TEST FAILED!");
        }
    }

    int binarySearch(int[] A, int X) {
        int N = A.length;
        if (N == 0) {
            return -1;
        }
        int l = 0;
        int r = N - 1;
        while (l < r) {

            // Add 1, so when there are only two elements left, the right element is chosen
            int m = l + (r - l + 1) / 2;

            if (A[m] > X) { // Take left half
                r = m - 1;
            } else { // Take right half
                l = m;
            }
        }
        if (A[l] == X) {
            return l;
        }
        return -1;
    }
}
