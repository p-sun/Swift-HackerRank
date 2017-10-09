// Bubblesort:
// https://www.hackerrank.com/challenges/ctci-bubble-sort/problem

import Foundation

// Extension to swap elements in an array
extension MutableCollection where Index == Int {
    mutating func swapAt(_ a: Int, _ b: Int) {
        Swift.swap(&self[a], &self[b])
    }
}

// read the integer n
//let n = Int(readLine()!)!

// read the array
//var array = readLine()!.components(separatedBy: " ").map{ Int($0)! }

var array = [333, 44, 88, 9999, 12]
var isSorted: Bool
var numberOfSwaps = 0

repeat {
    isSorted = true
    
    // Check each value in the array
    for i in 0..<array.count - 1 {
        
        // Compare current value to the next
        if array[i] > array[i + 1] {
            
            // Swap if needed
            array.swapAt(i, i + 1)
            isSorted = false
            numberOfSwaps += 1
        }
    }
    
} while (!isSorted)

print("Array is sorted in \(numberOfSwaps) swaps."
    + "\nFirst Element: \(array.first!)"
    + "\nLast Element: \(array.last!)")
