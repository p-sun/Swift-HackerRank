import java.io.*;

import java.io.*;
import java.util.*;

class myCode2 {
    public static ArrayList<Integer> carryOne(ArrayList<Integer> array, int carryAtIndex) {
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

    // Increment the value by one
    public static ArrayList<Integer> incrementArrayInt(ArrayList<Integer> array) {
        ArrayList<Integer> result = new ArrayList<Integer>();

        boolean carryOne = true;

        int i = 0;
        while (true) {
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
            input = "9979"; //br.readLine();
//            if (input == null) {
//                break;
//            }
            ArrayList<Integer> array = new ArrayList<Integer>();
            for(int i = 0; i < input.length(); i++){
                array.add(0, new Integer(input.substring(i, i + 1)));
            }
            // DO NOT EDIT
            ArrayList<Integer> answer = incrementArrayInt(array);
            printAnswer(answer);
            // END - DO NOT EDIT
//        }

    }
}
