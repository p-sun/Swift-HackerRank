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

extension String {
    /*
     Assume: Only count letters a - z, case insensitive
     
     Summary:
     1) Use a single UInt32 as a bit vector.
     2) For each letter, we map it to a single bit on the vector, and toggle that bit
     3) Check that at most a single bit is 1
     
     Steps:
     - var vector: UInt32 = 0
     - for each letter
        - create bit mask for that letter    e.g. letter B 1 << (98 - 97)
        - toggle the bit vector @ that mask
     - check vector that there is a single 1 bit, or the vector is 0
        - How to check a vector to see if exactly a bit is 1?
            - vector & (vector - 1) == 0
            -  1000  &     00111    == 0
     */
    func isPalindromePermutationFaster() -> Bool {
        func charMask(_ c: Character) -> UInt32? {
            guard let aAscii = Character("a").asciiValue,
                let cAscii = c.asciiValue else {
                    return nil
            }
            let cIndex = cAscii - aAscii
            return UInt32(1) << cIndex
        }
        
        let lowercasedLettersOnly = filter {
            return $0.description.rangeOfCharacter(from: .letters) != nil
        }.lowercased()
        
        var bitVector: UInt32 = 0
        for c in lowercasedLettersOnly {
            if let mask = charMask(c) {
                bitVector ^= mask
            }
        }
        
        return bitVector == 0 || bitVector & (bitVector - UInt32(1)) == 0
    }
}

// Case sensitive
assert("TaCT Cooa".isPalindromePermutation())
assert("AABBC".isPalindromePermutation())
assert("AAA".isPalindromePermutation())
assert("a".isPalindromePermutation())
assert(!"aaabbb".isPalindromePermutation())
assert("eeoolklk".isPalindromePermutation())

// Case insensitive
assert("TaCt cooa".isPalindromePermutationFaster())
assert("AABBC".isPalindromePermutationFaster())
assert("AAA".isPalindromePermutationFaster())
assert("a".isPalindromePermutationFaster())
assert(!"aaabbb".isPalindromePermutationFaster())
assert("eeoolklk".isPalindromePermutationFaster())
