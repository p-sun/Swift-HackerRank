import Foundation


// MARK: - String Subscript Extensions
public extension String {
    // Get the character at index.
    // "Hello"[1] = "e"
	subscript (i: Int) -> Character {
		return self[index(startIndex, offsetBy: i)]
	}

	// Get a subrange. i.e. "Palindrome"[1..<4] = "ali"
	subscript (bounds: CountableRange<Int>) -> Substring {
		let start = index(startIndex, offsetBy: bounds.lowerBound)
		let end = index(startIndex, offsetBy: bounds.upperBound)
		return self[start ..< end]
	}
	
    // Get a subrange. i.e. "Palindrome"[1...4] = "alin"
    // See why Swift lang doesn't have this by default: https://stackoverflow.com/questions/45497705/subscript-is-unavailable-cannot-subscript-string-with-a-countableclosedrange/46627527#46627527
	subscript (bounds: CountableClosedRange<Int>) -> Substring {
		let start = index(startIndex, offsetBy: bounds.lowerBound)
		let end = index(startIndex, offsetBy: bounds.upperBound)
		return self[start ... end]
	}
	
	// "Palindrome"[1...]
	subscript (bounds: CountablePartialRangeFrom<Int>) -> Substring {
		let start = index(startIndex, offsetBy: bounds.lowerBound)
		let end = index(endIndex, offsetBy: -1)
		return self[start ... end]
	}
	
	// "Palindrome"[...3]
	subscript (bounds: PartialRangeThrough<Int>) -> Substring {
		let end = index(startIndex, offsetBy: bounds.upperBound)
		return self[startIndex ... end]
	}
	
	// "Palindrome"[..<3]
	subscript (bounds: PartialRangeUpTo<Int>) -> Substring {
		let end = index(startIndex, offsetBy: bounds.upperBound)
		return self[startIndex ..< end]
	}
}

// MARK: - Character Helpers
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
			print("substring index out of bounds")
            return ""
        }
        
        var result = ""
        for k in start ... end {
            result.append(self[k])
        }
        return result
    }
}

public extension Substring {
	subscript (i: Int) -> Character {
		return self[index(startIndex, offsetBy: i)]
	}
	subscript (bounds: CountableRange<Int>) -> Substring {
		let start = index(startIndex, offsetBy: bounds.lowerBound)
		let end = index(startIndex, offsetBy: bounds.upperBound)
		return self[start ..< end]
	}
	subscript (bounds: CountableClosedRange<Int>) -> Substring {
		let start = index(startIndex, offsetBy: bounds.lowerBound)
		let end = index(startIndex, offsetBy: bounds.upperBound)
		return self[start ... end]
	}
	subscript (bounds: CountablePartialRangeFrom<Int>) -> Substring {
		let start = index(startIndex, offsetBy: bounds.lowerBound)
		let end = index(endIndex, offsetBy: -1)
		return self[start ... end]
	}
	subscript (bounds: PartialRangeThrough<Int>) -> Substring {
		let end = index(startIndex, offsetBy: bounds.upperBound)
		return self[startIndex ... end]
	}
	subscript (bounds: PartialRangeUpTo<Int>) -> Substring {
		let end = index(startIndex, offsetBy: bounds.upperBound)
		return self[startIndex ..< end]
	}
}
