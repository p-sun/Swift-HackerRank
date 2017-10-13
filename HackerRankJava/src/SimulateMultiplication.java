/* package whatever; // don't place package name! */

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;

//////////////////////////////////////////////////////////////////////
//////// READ THE ENTIRE QUESTION BEFORE STARTING             ////////
////////                                                      ////////
//////// Ensure that your code does NOT print out debug data  ////////
//////// or it will interfere with the automatic scoring.     ////////
//////////////////////////////////////////////////////////////////////

class myCodeMultiplication {
    public static ArrayList<Integer> multArrayInt(ArrayList<Integer> array, ArrayList<Integer> other) {
        ArrayList<Integer> result = new ArrayList<Integer>();

        // Index of the digit we're adding to the result.
        int i = 0;

        int carry = 0;

        int maxSize = array.size() + other.size() - 1;

        while (true) {
            // Base Case to exit
            if (i == maxSize) {
                if (carry > 9) {
                    result.add(carry % 10);
                    carry = carry / 10;
                    continue;
                } else if (carry > 0){
                    result.add(carry);
                }
                break;
            }

            // Sum all the products of digits contributing to result[i]. O(n)
            int sum = 0;
            for(int topIndex = 0; topIndex <= i; topIndex++) {

                int topDigit = 0;
                if (topIndex < array.size()) {
                    topDigit = array.get(topIndex);
                }

                int bottomDigit = 0;
                int bottomIndex = i - topIndex;
                if (bottomIndex < other.size()) {
                    bottomDigit = other.get(bottomIndex);
                }

                sum += topDigit * bottomDigit;
            }

            // Add carry to sum
            if (carry > 0) {
                sum += carry;
                carry = 0;
            }

            // Add digit to result, and calculate new carry
            if (sum > 9) {
                carry = sum / 10;
                sum = sum % 10;
            }
            result.add(sum);

            i++;
        }

        // Results with leading 0s is 0.
        ArrayList<Integer> zeroArray = new ArrayList<Integer>();
        zeroArray.add(0);
        if (result.get(i-1) == 0) {
            return  zeroArray;
        }

        return result;
    }

    /*************************************************************************
     * DO NOT EDIT - this is used in our automatic assessment.                *
     * Changing or altering this in any way will void your application.       *
     *************************************************************************/
    public static void printAnswer(ArrayList<Integer> answer) {
        // MSD is at the end. Print backwards.
        for (int i = answer.size() - 1; i >= 0; i--) {
            System.out.print(answer.get(i));
        }
        System.out.println("");
    }

    /*********************
     * It is highly recommended you
     * DO NOT change the main function.
     *********************/
    public static void main (String[] args) throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String input;
//        while (true) {
            input = "10;0";//br.readLine();
//            if (input == null) {
//                break;
//            }
            ArrayList<Integer> array = new ArrayList<Integer>();
            ArrayList<Integer> other = new ArrayList<Integer>();
            boolean doneFirst = false;
            for(int i = 0; i < input.length(); i++){
                String sub = input.substring(i, i + 1);
                if (!sub.equals(";") && !doneFirst) {
                    array.add(0, new Integer(sub));
                    continue;
                } else if (sub.equals(";")) {
                    doneFirst = true;
                    continue;
                }
                other.add(0, new Integer(sub));
            }
            // DO NOT EDIT
            ArrayList<Integer> answer = multArrayInt(array, other);
            printAnswer(answer);
            // END - DO NOT EDIT
//        }
    }
}
