/*:
 # Is Palindrome
 
Returns whether a String is a palindrome. Also filter out non-alphanumeric characters
 \
 [LeetCode](https://leetcode.com/problems/valid-palindrome/description)
*/

import Foundation

//: ## Method C
// Convert to Lowercase, test is palindrome.
// A palindrome test that cleans the string to contain only lowercase alphanumerics.
func isPalindrome(_ s: String) -> Bool {
    let characters = s.lowercased().charactersArray()
    
    // Only keep alphanumeric characters.
    let cleaned = characters.filter { character in        
        return character.description.rangeOfCharacter(from: CharacterSet.alphanumerics) != nil
    }
    
    // Test Palindrome-ness
    let total = cleaned.count
    for i in 0 ..< total/2 {
        if cleaned[i] != cleaned[total - 1 - i] {
            return false
        }
    }
    return true
}
 
isPalindrome("A man, a plan, a canal: Panama")

//: ## Method A
// Doesn't clean the string.
// Requires the String extension underneath to work with substrings.
func isPalindromeA(_ s: String) -> Bool {
    let total = s.count
    
    for i in 0 ..< total/2 {
        if s[i] != s[total - 1 - i] {
            return false
        }
    }
    return true
}

isPalindromeA("ABCBA")
isPalindromeA("ABBA")
isPalindromeA("ABCA")
isPalindromeA("")
isPalindromeA("A man, a plan, a canal: Panama")
//: ## Method B
// Behaves like method A, except it doesn't need a String extension.
func isPalindromeB(_ s: String) -> Bool {
    let chars = s.charactersArray()
    
    let total = chars.count
    
    for i in 0 ..< total/2 {
        if chars[i] != chars[total - 1 - i] {
            return false
        }
    }
    return true
}

isPalindromeB("ABCBA")
isPalindromeB("ABAL")
