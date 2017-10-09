import Foundation

public extension String {
    // Get the character at index.
    // "Hello"[1] = "e"
    subscript(_ offset: Int) -> String {
        let stringIndex = index(startIndex, offsetBy: offset)
        return self[stringIndex...stringIndex]
    }
    
    // Get a subrange. i.e. "Palindrome"[1...4] = "alin"
    // See why Swift lang doesn't have this by default: https://stackoverflow.com/questions/45497705/subscript-is-unavailable-cannot-subscript-string-with-a-countableclosedrange/46627527#46627527
    subscript (bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(start, offsetBy: bounds.upperBound - bounds.lowerBound)
        return self[start...end]
    }
    
    // Get a subrange. i.e. "Palindrome"[1..<4] = "ali"
    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(start, offsetBy: bounds.upperBound - bounds.lowerBound)
        return self[start..<end]
    }
    
    // To work with interview questions quickly, convert between String <-> [Character].
    // This way, you can use Array subscripts on it.
    func charactersArray() -> [Character] {
        return self.characters.filter{ _ in return true }
    }
}

public extension Array where Iterator.Element == Character {
    // To work with interview questions quickly, convert between String <-> [Character].
    // This way, you can use Array subscripts on it.
    func string() -> String {
        return self.reduce("") { result, character in
            return result.appending(character.description)
        }
    }
    
    // Give a substring for characters starting from start to end
    func string(start: Int, end: Int) -> String {
        guard start >= 0 && end < self.count && start <= end else {
            return ""
        }
        
        var result = ""
        for k in start ... end {
            result.append(self[k])
        }
        return result
    }
}
