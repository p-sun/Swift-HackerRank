import Foundation

// Print an in array separated by spaces.
// [1, 2, 3, 4] -> "1 2 3 4"
public extension Sequence where Iterator.Element == Int {
    func printArray() {
        print(
            self
                .map({"\($0)"})
                .joined(separator: " ")
        )
    }
}
