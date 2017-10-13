/* package whatever; // don't place package name! */

import java.io.*;
import java.util.*;

//////////////////////////////////////////////////////////////////////
//////// READ THE ENTIRE QUESTION BEFORE STARTING             ////////
////////                                                      ////////
//////// Ensure that your code does NOT print out debug data  ////////
//////// or it will interfere with the automatic scoring.     ////////
//////////////////////////////////////////////////////////////////////

class myCode {
    private static ArrayList<Integer> carryOne(ArrayList<Integer> array, int carryAtIndex) {
        ArrayList<Integer> result = new ArrayList<Integer>();

        boolean carryOne = false;

        int i = 0;
        while (true) {
            if (i == carryAtIndex) {
                carryOne = true;
            }

            if (i == array.size()) {
                if (carryOne) {
                    result.add(1);
                }
                break;
            }

            int digit = array.get(i);
            if (carryOne && digit == 9) {
                digit = 0;
            } else if (carryOne) {
                digit += 1;
                carryOne = false;
            }
            result.add(digit);

            i++;
        }

        return result;
    }

    public static ArrayList<Integer> addArrayInt(ArrayList<Integer> array, ArrayList<Integer> other) {
        ArrayList<Integer> result = new ArrayList<Integer>();

        int i = 0;

        boolean carryOne = false;

        int maxSize = Math.max(array.size(), other.size());

        while (true) {
            // Base Case to exit.
            if (i == maxSize) {
                if (carryOne) {
                    result.add(1);
                }
                break;
            }

            // Add both digits at index i
            int arrayDigit = 0;
            if (i < array.size()) {
                arrayDigit = array.get(i);
            }
            int otherDigit = 0;
            if (i < other.size()) {
                otherDigit = other.get(i);
            }
            int sum = arrayDigit + otherDigit;

            if (carryOne) {
                sum += 1;
                carryOne = false;
            }

            if (sum > 9) {
                sum = sum % 10;
                carryOne = true;
            }

            result.add(sum);
            i++;
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
    public static void main (String[] args) throws java.lang.Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String input;
//        while (true) {
            input = "78979;456";//br.readLine();
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
            ArrayList<Integer> answer = addArrayInt(array, other);
            printAnswer(answer);
            // END - DO NOT EDIT
//        }
    }
}
