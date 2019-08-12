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
    let characters = Array(s.lowercased())
    
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
// Behaves like method A, except it doesn't need a String extension
// BUT this is 5 times slower b/c Array(s) is slow
func isPalindromeB(_ s: String) -> Bool {
    let chars = Array(s)
    
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

var start = Date()
for i in 0...1000 {
    isPalindromeA("QWERTYUIOPOIUYTREWQ")
}
print(Date().timeIntervalSince(start)) // 0.0300050973892212

start = Date()
for i in 0...1000 {
    isPalindromeB("QWERTYUIOPOIUYTREWQ")
}
print(Date().timeIntervalSince(start)) // 0.145528078079224
