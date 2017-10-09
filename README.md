# Swift HackerRank Solutions
My HackerRank, CTCI, and LeetCode algorithm solutions in Swift 3 Playgrounds.

Everything comes with test cases and runs on Playgrounds. Each solution passes all the tests on HackerRank or LeetCode if I included a link.

## Algorithm Index
Click though the index to view specific Playgrounds.

![Index][index]

## HackerRank Helpers for String Manipulation

To work with HackerRank questions quickly, I've included some helper methods to convert between String <-> [Character], and to access substrings at specifc indicies.

```swift
"ABCD".charactersArray() // ["A", "B", "C", "D"]

["a", "b", "c"].string() // "abc"

"Palindrome"[1...4] //"alin"

"Palindrome"[1..<4] // "ali"

"Padlindrome"[1] // "a"
```

## HackerRank Helpers for Reading Input

Read the next integer that's on a single line.
"3" 
-> 3
```swift
let int: Int = intForLine()
```

Read input of numbers each on a separate line as an int array. 
The first number denotes how many lines to read.
3 
10 
11 
12
-> [10, 11, 12]
```swift
let intArray: [Int] = intArrayForMultipleLines()
```

Read input of a numbers separated by spaces as an int array.
"1 2 3 4" 
-> [1, 2, 3, 4]
```swift
let intArray: [Int] = intArrayForLine()
```

Read input of a Strings separated by spaces as an String array.
"Cat Dog Bird"
-> ["Cat", "Dog", "Bird"]
```swift
let stringArray: [String] = stringArrayForLine()
```

## Playground Markup
Demo code illutrating how to format text for Playgrounds.

![Markup][markup]

[index]: https://github.com/p-sun/Swift-HackerRank/blob/master/Images/index-preview.png "Index Preview"
[markup]: https://github.com/p-sun/Swift-HackerRank/blob/master/Images/playground-markup.png "Playground markup demo"
