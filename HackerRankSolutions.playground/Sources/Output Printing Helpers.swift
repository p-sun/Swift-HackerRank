import Foundation

// Print an in array separated by spaces.
// [1, 2, 3, 4] -> "1 2 3 4"

public enum SeparatorType {
	case spaces, newLine
}

public extension Sequence {
	func printArrayWithSpaces() {
        print(
            self
                .map({"\($0)"})
                .joined(separator: " ")
        )
    }
	
	func printArrayWithNewLines() {
		print(
			self
				.map({"\($0)"})
				.joined(separator: "\n")
		)
	}
}
