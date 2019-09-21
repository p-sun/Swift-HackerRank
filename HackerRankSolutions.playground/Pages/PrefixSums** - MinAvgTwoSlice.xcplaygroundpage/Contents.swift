/*:
 # MinAvgTwoSlice
 
 Find the minimal average of any slice containing at least two elements.

 // https://app.codility.com/programmers/lessons/5-prefix_sums/min_avg_two_slice/
 
 * A non-empty array A consisting of N integers is given.
 * A pair of integers (P, Q), such that 0 ≤ P < Q < N, is called a slice of array A (notice that the slice has 2+ elements).
 * The average of a slice (P, Q) is the sum of A[P] + A[P + 1] + ... + A[Q] divided by the length of the slice.
 
 The goal is to find the starting position of a slice whose average is minimal.
 
 */
import Foundation

public func solution(_ A : inout [Int]) -> Int {
    return minAvgTwoSliceEfficient(A)
}

/// prefixSum[i] is the total of all numbers from 0...i
func prefixSums(_ arr: [Int]) -> [Int] {
    var sums = arr
    for i in 1..<arr.count {
        sums[i] = sums[i - 1] + arr[i]
    }
    return sums
}

// This link proves that
// (1) There must be some slices, with length of two or three, having the minimal average value among all the slices.
// (2) And all the longer slices with minimal average are built up with these 2-element and/or 3-element small slices.
// https://codesays.com/2014/solution-to-min-avg-two-slice-by-codility/

// Also NOTE!!!!! using 3 let avg1, let avg2, let avg3 is much faster than reusing one var avg in this function
// So keep using lots of lets instead of vars

// Also Note!!! make internal functions whenever possible. It's easier to read, and as it gets reused, it gets faster
// (presumably because complier moves that function to a faster part of memory)
func minAvgTwoSliceEfficient(_ array: [Int]) -> Int {
    let prefixSumsArr = prefixSums(array)
    var minAverage: Double = Double(array[0])
    var startPositionOfMinAvg: Int = 0
    
    func total(from fromIndex: Int, to toIndex: Int) -> Int {
        guard fromIndex > 0 else {
            return prefixSumsArr[toIndex]
        }
        return prefixSumsArr[toIndex] - prefixSumsArr[fromIndex - 1]
    }
    
    func setMinAverageIfNeeded(startIndex: Int, size: Int) {
        let avg = Double(total(from: startIndex, to: startIndex + size - 1)) / Double(size)
        if avg < minAverage {
            minAverage = avg
            startPositionOfMinAvg = startIndex
        }
    }
    
    if array.count > 2 {
        for start in 0...array.count - 3 {
            setMinAverageIfNeeded(startIndex: start, size: 2)
            setMinAverageIfNeeded(startIndex: start, size: 3)
        }
    }
    setMinAverageIfNeeded(startIndex: array.count - 2, size: 2)
    
    return startPositionOfMinAvg
}


// Return the starting position of the slice with the smallest value
// This is a bit better than completely brute force, because we use prefix sums to calculate array slice totals
// But we're still iterating through O(n^2) slices
func minAvgTwoSliceNotEfficient(_ array: [Int]) -> Int {
    
    let prefixSumsArr = prefixSums(array)
    
    func total(from fromIndex: Int, to toIndex: Int) -> Int {
        guard fromIndex > 0 else {
            return prefixSumsArr[toIndex]
        }
        return prefixSumsArr[toIndex] - prefixSumsArr[fromIndex - 1]
    }
    
    var minAverage: Double = Double(array[0])
    var startPositionOfMinAvg: Int = 0
    
    for i in 0..<array.count - 1 {
        for j in i+1..<array.count {
            let avg: Double = Double(total(from: i, to: j)) / Double(j - i + 1)
            if avg < minAverage {
                minAverage = avg
                startPositionOfMinAvg = i
            }
        }
    }
    return startPositionOfMinAvg
}

assert(minAvgTwoSliceNotEfficient([4, 2, 2, 5, 1, 5, 8]) == 1)
assert(minAvgTwoSliceEfficient([4, 2, 2, 5, 1, 5, 8]) == 1)

assert(minAvgTwoSliceEfficient([4, 2]) == 0)
assert(minAvgTwoSliceEfficient([6, 2, 4, 2]) == 1)

//var start = Date()
//print(start)
//for _ in 1 ... 1000 {
//    minAvgTwoSliceEfficient([4, 2, 2, 5, 1, 5, 8])
//}
//print(Date().timeIntervalSince(start))
//
//start = Date()
//print(start)
//for _ in 1 ... 1000 {
//    minAvgTwoSliceEfficient2([4, 2, 2, 5, 1, 5, 8])
//}
//print(Date().timeIntervalSince(start))
