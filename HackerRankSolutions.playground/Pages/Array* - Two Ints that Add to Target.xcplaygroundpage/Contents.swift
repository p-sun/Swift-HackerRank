/*:
 [LeetCode](https://leetcode.com/problems/two-sum/description/)
 * Given an array of integers, return indices of the two numbers such that they add up to a target.
 * You may assume that each input would have exactly one solution
 * You may not use the same index twice.
 * i.e. Given nums = [2, 7, 11, 15], target = 9, return [0, 1].
 */
//: ---
//: Method A - One Pass - Most efficient
// Add nums to a HashMap
// For every element, check if the complement exists in the HashMap.
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var dict = [Int: Int]() // [n: index of n]
    
    for (currentIndex, n) in nums.enumerated() {
        let complement = target - n
        if let complementIndex = dict[complement] {  // dict[complement] operation is O(1).
            return [complementIndex, currentIndex]
        }
        
        dict[n] = currentIndex
    }
    
    fatalError("No valid outputs")
}

twoSum([2, 7, 11, 15], 9)
twoSum([4, 7, 11, 2], 9)
twoSum([3, 2, 4], 6)
twoSum([3, 3], 6)
//: ---
//: Method B - Two Pass
// Pass 1 -> add nums to a HashMap
// Pass 2 -> for every element, check if the complement exists
func twoSumB(_ nums: [Int], _ target: Int) -> [Int] {

    // In O(n), add each value in nums into dict.
    // Key is n, value is the index.
    var dict: [Int: Int] = [:]
    for (index, n) in nums.enumerated() {
        dict[n] = index
    }
    
    // In O(n). For each value a in nums, see if the difference exists.
    for (aIndex, a) in nums.enumerated() {
        let b = target - a
        if let bIndex = dict[b], aIndex != bIndex { // Note dict[b] operation is O(1).
            return [aIndex, bIndex]
        }
    }

    return [0, 0]
}

twoSumB([2, 7, 11, 15], 9)
twoSumB([4, 7, 11, 2], 9)
twoSumB([3, 2, 4], 6)
twoSumB([3, 3], 6)

import Foundation



