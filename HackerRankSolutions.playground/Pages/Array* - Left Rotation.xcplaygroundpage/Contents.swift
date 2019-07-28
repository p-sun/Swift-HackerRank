// https://www.hackerrank.com/challenges/ctci-array-left-rotation/problem
// Rotate an array by d positions to the left.
 
import Foundation

func rotateLeft(_ array: [Int], rotateBy: Int) -> [Int] {
    var result = [Int]()
    
    for i in 0 ..< array.count {
        let oldIndex = (i + rotateBy) % array.count
        result.append(array[oldIndex])
    }
    
    return result
}

// Read input from file
let line1 = [5, 4] //intArrayForLine()
let rotateBy = line1[1]
let array = [1, 2, 3, 4, 5] //intArrayForLine()

// Execute Test
let result = rotateLeft(array, rotateBy: rotateBy)
result.printArrayWithSpaces() // [5, 1, 2, 3, 4]
