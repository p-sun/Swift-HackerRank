// Count the number of possible palindrome substrings in a string.
// i.e. "aaa" has 6 palindromes.

//: ## Method A - Brute Force
// Time complexity is O(n^3).
// For every substring O(n^2), check if that substring is a palindrome O(n).
func countPalindromes(s: String) -> Int {

    // O(n) to check if a word is a Palindrome.
    func isPalindrome(_ chars: [Character], _ i: Int, _ j: Int) -> Bool {
        let count = j - i + 1
        for offset in 0 ..< count/2 {
            if chars[i + offset] != chars[i + count - 1 - offset] {
                return false
            }
        }
        
        return true
    }
    
    var count = 0
    let chars = s.charactersArray()
    // O(n^2) for loop to check every substring.
    for i in 0 ..< chars.count {
        for j in i ..< chars.count {
            if isPalindrome(chars, i, j) {
                count = count + 1
            }
        }
    }
    
    return count
}

countPalindromes(s: "aaa") // 6
countPalindromes(s: "abccba") // 9
countPalindromes(s: "abcde") // 5
countPalindromes(s: "hellolle") // 13
countPalindromes(s: "lasagna") // 8

//: ## Method B - Iterative - More Efficient
// Time Complexity O(n^2).
// For every center, check if the 1 or 2 letters at the center is a palindrome.
// Then increase the start and end of the palindrome by 1, until it's no longer longer a palindrome,
// or until the start or end surpases the bounds of the String.
func countPalindromesB(s: String) -> Int {
    var count = 0

    func expandPalindrome(center: Int, isOdd: Bool) {
        var start = center
        var end = center + (isOdd ? 0 : 1)

        while (start >= 0 && end < s.count && s[start] == s[end]) {
            count = count + 1
            start = start - 1
            end = end + 1
        }
    }

    for center in 0 ..< s.count {
        expandPalindrome(center: center, isOdd: true)
        expandPalindrome(center: center, isOdd: false)
    }
    
    return count
}

countPalindromesB(s: "aaa") // 6
countPalindromesB(s: "abccba") // 9
countPalindromesB(s: "abcde") // 5
countPalindromesB(s: "hellolle") // 13
countPalindromesB(s: "lasagna") // 8
