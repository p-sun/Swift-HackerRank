/*:
 # Longest Common Subsequence (LCS)
 [HackerRank](https://www.hackerrank.com/challenges/dynamic-programming-classics-the-longest-common-subsequence/problem)
 
 A subsequence can be derived from a sequence where
 - the order doesn't change
 - elements in the subsequence DONT have to consequtive in the sequence
 
 Given 2 sequences, what's the longest (max length) common subsequences to both sequences?
 */

import Foundation

//: ## Method 1: Recursive
func longestCommonSubsequence(a: [Int], b: [Int]) -> [Int] {
    // Either array is empty
    guard let aLast = a.last, let bLast = b.last else { return [] }
    
    // Two arrays end in same letters
    if aLast == bLast {
        return longestCommonSubsequence(a: Array(a.dropLast()),
                                        b: Array(b.dropLast())) + [aLast]
    }
    
    // Two arrays end in different letters
    let aLcs = longestCommonSubsequence(a: Array(a.dropLast()),
                                        b: b)
    let bLcs = longestCommonSubsequence(a: a,
                                        b: Array(b.dropLast()))
    if aLcs.count >= bLcs.count {
        return aLcs
    } else {
        return bLcs
    }
}

/*:
 ## Method 2: Memorization
 
 Optimization 1:
 - Use indicies to navigate arrays, instead of creating new arrays to pass into functions
 - e.g. aLastInd is the `last index of array a`
 
 Optimization 2:
 - Memorization
 */
func longestCommonSubsequenceM(a: [Int], b: [Int]) -> [Int] {
    var memo = [String: [Int]]()
    
    func lcs(aLastInd: Int, bLastInd: Int) -> [Int] {
        
        // Either array is empty
        guard aLastInd >= 0, bLastInd >= 0 else { return [] }
        
        // Check memoroized values
        let key = "\(aLastInd) \(bLastInd)"
        if let result = memo[key] {
            return result
        }
        
        // Two arrays end in same letters
        let aLastElement = a[aLastInd]
        let bLastElement = b[bLastInd]
        
        if aLastElement == bLastElement {
            let subsequence = lcs(aLastInd: aLastInd - 1,
                                  bLastInd: bLastInd - 1) + [aLastElement]
            return subsequence
        }
        
        // Two arrays end in different letters
        let aLcs = lcs(aLastInd: aLastInd - 1,
                       bLastInd: bLastInd)
        let bLcs = lcs(aLastInd: aLastInd,
                       bLastInd: bLastInd - 1)
        
        // Get the longer lcs & memoize answer
        if aLcs.count >= bLcs.count {
            memo[key] = aLcs
            return aLcs
        } else {
            memo[key] = bLcs
            return bLcs
        }
    }
    
    return lcs(aLastInd: a.count - 1, bLastInd: b.count - 1)
}

/*:
 ## Method 3: Memorization with Int Key
 ### Extremely small optimization for HackerRank (0.00042s improvement)
  (Sometimes it's faster, sometimes it isn't)
 
 Optimization 1 & 2 is same as above
 
 Optimization 3:
 - Callout(Given constraints):
0 ≤ n, m ≤ 100
\
0 ≤ a[i] < 1000 where i ∈ [1, n]
\
0 ≤ b[j] < 1000 where j ∈ [1, m]

 - So we know each array wont exceed length of 100
 
 - Thus, we can calculate keys with Int
 \
 `let key = aLastInd * 100 + bLastInd`
 \
 instead of
 \
 `let key = "\(aLastInd) \(bLastInd)"` Used in method 2
 
 Note:
 \
 Hashvalue can't be used to make keys b/c
 \
 `7.hashValue ^ 3.hashValue == 3.hashValue ^ 7.hashValue`
*/

func longestCommonSubsequenceMWithInt(a: [Int], b: [Int]) -> [Int] {
    var memo = [Int: [Int]]()
    
    func lcs(aLastInd: Int, bLastInd: Int) -> [Int] {
        
        // Either array is empty
        guard aLastInd >= 0, bLastInd >= 0 else { return [] }
        
        // Check memoroized values
        let key = aLastInd * 100 + bLastInd
        if let result = memo[key] {
            return result
        }
        
        // Two arrays end in same letters
        let aLastElement = a[aLastInd]
        let bLastElement = b[bLastInd]
        
        if aLastElement == bLastElement {
            let subsequence = lcs(aLastInd: aLastInd - 1,
                                  bLastInd: bLastInd - 1) + [aLastElement]
            return subsequence
        }
        
        // Two arrays end in different letters
        let aLcs = lcs(aLastInd: aLastInd - 1,
                       bLastInd: bLastInd)
        let bLcs = lcs(aLastInd: aLastInd,
                       bLastInd: bLastInd - 1)
        
        // Get the longer lcs & memoize answer
        if aLcs.count >= bLcs.count {
            memo[key] = aLcs
            return aLcs
        } else {
            memo[key] = bLcs
            return bLcs
        }
    }
    
    return lcs(aLastInd: a.count - 1, bLastInd: b.count - 1)
}

var start = Date()
var end: TimeInterval = 0
longestCommonSubsequence(a: [1,2,3,2,4,1,2], b: [2,4,3,1,2,1]) // 2 3 2 1 & others
longestCommonSubsequence(a: [1,2,3,4,1], b: [3,4,1,2,1,3]) // 1 2 3 & others
longestCommonSubsequence(a: [3,9,8,3,9,7,9,7,0], b: [3,3,9,9,9,1,7,2,0,6]) // 3 9 9 9 7 0 & others
end = Date().timeIntervalSince(start)
print("Recursive: ", end)


start = Date()
longestCommonSubsequenceM(a: [1,2,3,2,4,1,2], b: [2,4,3,1,2,1])
longestCommonSubsequenceM(a: [1,2,3,4,1], b: [3,4,1,2,1,3])
longestCommonSubsequenceM(a: [3,9,8,3,9,7,9,7,0], b: [3,3,9,9,9,1,7,2,0,6])
end = Date().timeIntervalSince(start)
print("Memorization: ", end)


start = Date()
longestCommonSubsequenceMWithInt(a: [1,2,3,2,4,1,2], b: [2,4,3,1,2,1])
longestCommonSubsequenceMWithInt(a: [1,2,3,4,1], b: [3,4,1,2,1,3])
longestCommonSubsequenceMWithInt(a: [3,9,8,3,9,7,9,7,0], b: [3,3,9,9,9,1,7,2,0,6])
end = Date().timeIntervalSince(start)
print("Memorization assuming each array has length < 100: ", end)
