/*:
 1.5 There are three types of characeter edits on strings: insert, replace, or delete.
 Write a function to return if one string is 0 or 1 edit away from the other
 */

extension String {
    func zeroOrOneEditAway(from s: String) -> Bool {
        let (shorter, longer) = count < s.count ? (self, s) : (s, self)
        
        guard longer.count - shorter.count <= 1 else { return false }

        for (i, charShorter) in shorter.enumerated() {
            let charLonger = longer[i]
            
            // If a char is different
            guard charShorter != charLonger else { continue }
            var shorter = shorter
            
            // Replace or insert the different char in shorter string
            // & compare the new shorter and longer strings
            if shorter.count == longer.count {
                shorter.replaceAtIndex(index: i, c: charLonger)
            } else {
                let insertIndex = Index(utf16Offset: i, in: self)
                shorter.insert(charLonger, at: insertIndex)
            }
            return shorter == longer
        }
        return true
    }
}

public extension String {
    mutating func replaceAtIndex(index: Int, c: Character) {
        let i = Index(utf16Offset: index, in: self)
        guard i < endIndex else { return }
        replaceSubrange(i...i, with: [c])
    }
}

assert("pale".zeroOrOneEditAway(from: "ple"))
assert("pale".zeroOrOneEditAway(from: "pale"))
assert("pale".zeroOrOneEditAway(from: "pales"))
assert(!"pale".zeroOrOneEditAway(from: "bake"))
