
/*: # Binary Gap
 
  Binary gap within a positive integer n is any maximal sequence of consecutive zeros,
    * surrounded by ones at both ends
    * in the binary representation of n
*/

import Foundation

func lengthOfMaxBinaryGap(_ n: Int) -> Int {
    let binaryString = binaryNumberTailRecursive(n)
    let binaryArray = Array(binaryString)
    
    var maxGap = 0
    var currentGap = 0
    
    for c in binaryArray {
        if currentGap > 0 {
            if c == "0" {
                currentGap += 1
            } else {
                maxGap = max(maxGap, currentGap)
                currentGap = 0
            }
        } else {
            if c == "0" {
                currentGap += 1
            } else {
                // Was not previously in a gap, and then did not get into a gap
                // Do nothing
            }
        }
    }

    return maxGap
}

func binaryNumber(_ n: Int) -> String {
    if n < 2 {
        return String(n)
    }
    return binaryNumber(n / 2) + String(n % 2) // NOTE2
}

func binaryNumberTailRecursive(_ n: Int) -> String {
    func _binary(_ n: Int, result: String) -> String {
        print("n:", n, "   result:", result) // Note1!!! To debug tail recursion, print each call

        if n < 2 {
            print("final result:", String(n) + result) // Note1!!! and print the base case
            return String(n) + result
        }
        
        // NOTE2 !!! this is backwards from the tail recursive return
        return _binary(n / 2, result: String(n % 2) + result)
    }
    return _binary(n, result: "")
}

assert(binaryNumber(0) == "0")
assert(binaryNumber(1) == "1")
assert(binaryNumber(2) == "10")
assert(binaryNumber(3) == "11")
assert(binaryNumber(5) == "101")
assert(binaryNumber(11) == "1011")

assert(binaryNumber(1041) == "10000010001")
assert(binaryNumber(32) == "100000")

assert(binaryNumberTailRecursive(11) == "1011")
//assert(binaryNumberTailRecursive(1041) == "10000010001")

//lengthOfMaxBinaryGap(1041) // binary = 10000010001 -> gap = 5
//lengthOfMaxBinaryGap(32) // binary = 100000 -> gap = 0
