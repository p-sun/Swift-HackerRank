// Given a String, cut 0 to count-1 letters from it.
// Print return all permutations of the cuts, in alphabetically sorted order.

// i.e. "abc" has 6 permutation after cuts of letters are removed.
// "a", "ab", "abc", "ac", " bc", "c"

func buildSubsequences(s: String) -> [String] {
    var permutations: [String] = [s]

    let chars = s.charactersArray()

    for lengthToCut in 1 ..< chars.count {
        for startOfCut in 0 ... chars.count - lengthToCut {
            let firstHalf: String
            if startOfCut > 0 {

                firstHalf = s[0...startOfCut - 1].description
            } else {
                firstHalf = ""
            }

            let secondHalf: String
            if startOfCut + lengthToCut < chars.count {
                secondHalf = s[startOfCut + lengthToCut ... chars.count - 1].description
            } else {
                secondHalf = ""
            }

            permutations.append(firstHalf + secondHalf)
        }
    }

    return permutations.sorted()
}
//
//let sequences = buildSubsequences(s: "abcd")
//for s in sequences {
//    print(s)
//}

"Palindrome"[1...4]
"Palindrome"[1] // "a"
"Palindrome"[1..<4] // "ali"
"Palindrome"[1...4] //"alin"
"Palindrome"[1...]  // => bcde
"Palindrome"[...3]  // => abcd
"Palindrome"[..<3]  // => abc
