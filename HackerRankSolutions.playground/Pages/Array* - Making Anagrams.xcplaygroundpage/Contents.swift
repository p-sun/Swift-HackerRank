// https://www.hackerrank.com/challenges/ctci-making-anagrams/problem
// Find the minimum number of character deletions required to make two strings anagrams of each other.
// i.e. Given "abc" and "uwbja", we need to delete 4 letters total so they'd become "ab" and "ba".
// It is guaranteed that a and b consist of lowercase English alphabetic letters (i.e. a through z).

import Foundation

// Method A. Time O(a + b)
func numberNeeded(_ a: String, _ b: String) -> Int {
    var letters: [Character: Int] = [:]
    
    for c in a.characters {
        letters[c] = (letters[c] ?? 0) + 1
    }
    for c in b.characters {
        letters[c] = (letters[c] ?? 0) - 1
    }

    return letters.reduce(0) { sum, letter in
        return sum + abs(letter.value)
    }
}

let a = "abcde"
let b = "bcdfg"

print(numberNeeded(a, b))
