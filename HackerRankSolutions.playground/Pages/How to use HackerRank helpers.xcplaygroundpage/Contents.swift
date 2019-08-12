/*:
 # How to use HackerRank Helpers
 There are boilerplate helpers methods in the Sources folder in this playground. Here's a demo.
 
 ## String Manipulation
 To work with HackerRank questions quickly, convert between String <-> [Character].
 */
Array("ABCD") // ["A", "B", "C", "D"]

["a", "b", "c"].string() // "abc"

"Palindrome"[1] // "a"
"Palindrome"[1..<4] // "ali"
"Palindrome"[1...4] //"alin"
"Palindrome"[1...]  // => bcde
"Palindrome"[...3]  // => abcd
"Palindrome"[..<3]  // => abc

// With substrings:
let sub = "abcde"[0...]
type(of: sub)
sub[1]     // => b
sub[1..<3] // => bc
sub[1...3] // => bcd
sub[1...]  // => bcde
sub[...3]  // => abcd
sub[..<3]  // => abc
/*:
 ## Input reading
 
 Read the next integer that's on a single line.
 - Callout(Input):
3 -> 3
 */
//let int: Int = intForLine()
/*:
 Read input of numbers each on a separate line as an int array.
 \
 The first number denotes how many lines to read.
 
 - Callout(Input):
 3
 \
10
 \
11
 \
12 -> [10, 11, 12]
 */
//let intArray = intArrayForMultipleLines()
/*:
Read input of a numbers separated by spaces as an int array.
 - Callout(Input):
"1 2 3 4" -> [1, 2, 3, 4]
 */
//let intArray = intArrayForLine()
/*:
 Read input of a Strings separated by spaces as an String array.
 - Callout(Input):
"Cat Dog Bird" -> ["Cat", "Dog", "Bird"]
 */
//let stringArray = stringArrayForLine()
/*:
 ## Output printing
 HackerRank expects element in an array to be separated by spaces.
 */
[1, 2, 3, 4].printArrayWithSpaces() // "1 2 3 4"
/*:
## Basic HackerRank Solution Template
 
     import Foundation
     
     // Solution ----------------------
     func numberNeeded(_ first: String, _ second: String) -> Int {
        return 0
     }
     
     // HackerRank Helpers ------------
     // Insert helpers here
     
     // Read input from file ----------
     let a = readLine()!
     let b = readLine()!
     
     // Execute -----------------------
     print(numberNeeded(a, b))
 */
