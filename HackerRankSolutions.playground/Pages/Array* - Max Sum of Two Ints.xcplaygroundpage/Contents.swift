// Given an array of integers, return the sum of greatest two.

import Foundation

func sumOfLargestTwo(_ array: [Int]) -> Int {
    var largest = 0
    var secondLargest = 0
    
    array.forEach {
        if $0 > largest {
            secondLargest = largest
            largest = $0
        } else if $0 > secondLargest {
            secondLargest = $0
        }
    }

    return largest + secondLargest
}

sumOfLargestTwo([3, 4, 2, 8, 9]) // 17
