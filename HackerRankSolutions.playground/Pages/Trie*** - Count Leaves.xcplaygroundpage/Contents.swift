/*:
 # Trie
 https://www.hackerrank.com/challenges/ctci-contacts/problem
 \
 Method 1 add words to a trie.
 \
 Method 2 returns the number of contacts with that prefix.
 The input doesn't have any duplicates for the add operation.
 \
 \
 Performance optimizations:
 * Node's unused variables was removed, such as pointer to parent, and the isCompleteWord boolean.
 * To track children, use Array<Node?> instead of [Character: Node]. This is because either the Array has signifiantly less overhead than Dictionaries, or because iterating `for character in word.characters` is slower than iterating `for letterScalar in word.unicodeScalars`. TODO: Test this
 */

class Node {
    var children: [Node?] = Array<Node?>(repeating: nil, count: 26)
    var leavesCount = 0 // # of leaves. i.e. # of words beginning with this Node.
}

// Given a letter "a" to "z", return a number from 0 - 25.
private func indexForLetter(_ letter: UnicodeScalar) -> Int {
    let startIndex = "a".description.unicodeScalars.first!.value // 97
    return Int(letter.value - startIndex)
}

func insert(_ word: String) {
    var current = root
    
    for letterScalar in word.unicodeScalars {
        let index = indexForLetter(letterScalar)
        if let childNode = current.children[index] {
            current = childNode
        } else {
            let newChild = Node()
            current.children[index] = newChild
            current = newChild
        }
        
        // Good b/c the input doesn't have any duplicates for the add operation.
        current.leavesCount = current.leavesCount + 1
    }
}

// Count the number of complete words branching from a node.
// This is correct but slow for HackerRank's tests.
func countLeaves(_ prefix: String) -> Int {
    var current = root
    
    // Get current node for prefix
    for letterScalar in prefix.unicodeScalars {
        let index = indexForLetter(letterScalar)
        if let childNode = current.children[index] {
            current = childNode
        } else {
            return 0
        }
    }
    
    return current.leavesCount
}
//: ## HackerRank Solution
//import Foundation

//let numCommands = Int(readLine()!)!
//
//for i in 1...numCommands {
//    let line = readLine()!.components(separatedBy: [" "])
//    let command = line[0]
//    let word = line[1]
//    
//    if command == "add" {
//        insert(word)
//    } else if command == "find" {
//        print(countLeaves(word))
//    }
//}
//: ## Playground Testing
var root = Node()

insert("hac")
insert("hackerrank")
countLeaves("hak")
countLeaves("hac")

