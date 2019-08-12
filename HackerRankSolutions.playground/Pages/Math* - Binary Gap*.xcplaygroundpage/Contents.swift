
/*: # Binary Gap
 
  Binary gap within a positive integer n is any maximal sequence of consecutive zeros,
    * surrounded by ones at both ends
    * in the binary representation of n
*/
func lengthOfMaxBinaryGap(_ n: Int) -> Int {
    let binaryString = String(n, radix: 2)
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

assert(lengthOfMaxBinaryGap(1041) == 5) // binary = 10000010001 -> gap = 5
assert(lengthOfMaxBinaryGap(32) == 0) // binary = 100000 -> gap = 0
