// HackerRank Helpers to read input

import Foundation

// Read input of a numbers separated by spaces as an int array.
// "1 2 3 4" -> [1, 2, 3, 4]
public func intArrayForLine() -> [Int] {
    return readLine()!
        .components(separatedBy: [" "])
        .map {
            Int($0.trimmingCharacters(in: .whitespacesAndNewlines))!
    }
}

// Read input of a strings separated by spaces as an String array.
// "Cat Dog Bird" -> ["Cat", "Dog", "Bird"]
public func stringArrayForLine() -> [String] {
    return readLine()!
        .components(separatedBy: [" "])
        .map {
            String($0.trimmingCharacters(in: .whitespacesAndNewlines))
    }
}

// Read input of numbers each on a separate line as an int array.
// The first number denotes how many lines to read.
/*
"3
10
11
12"
-> [10, 11, 12]
 */
public func intArrayForMultipleLines() -> [Int] {
    let count = intForLine()
    var result = [Int]()
    
    for _ in 0..<count {
        result.append(intForLine())
    }
    
    return result
}

// Read the next integer that's on a single line.
// "3" -> 3
public func intForLine() -> Int {
    return Int(readLine()!.trimmingCharacters(in: .whitespacesAndNewlines))!
}
