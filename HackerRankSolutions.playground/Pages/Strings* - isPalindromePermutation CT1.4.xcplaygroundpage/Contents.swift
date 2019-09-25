/*:
 ## Palindrome Permutation
 CTCI 1.4
 
 Check if a string is a permutation of a palindrome
*/
import Foundation
extension String {
    
    // Assumes we only count letter characters
    // Checks each letter and place or remove each character in a dictionary -- O(n) time & space
    // Then, look for characters occurs an odd number of times
    //   - Palindrom permutation has 0 or 1 of these characters
    func isPalindromePermutation() -> Bool {
        
        // Only keep alphanumeric characters.
        let lettersOnlyString = filter { character in
            return character.description.rangeOfCharacter(from: .letters) != nil
        }
        
        let counts = lettersOnlyString.characterCounts()
        let charsWithOddCount = counts.filter { $0.value % 2 != 0 }
        return charsWithOddCount.count <= 1
    }
    
    private func characterCounts() -> [Character: Int] {
        var counts = [Character: Int]()
        for c in self {
            if let charCount = counts[c] {
                counts[c] = charCount + 1
            } else {
                counts[c] = 1
            }
        }
        return counts
    }
}

assert("TaCT Cooa".isPalindromePermutation())
assert("AABBC".isPalindromePermutation())
assert("AAA".isPalindromePermutation())
assert("a".isPalindromePermutation())
assert(!"aaabbb".isPalindromePermutation())
