import Foundation

public extension String {
    // "A Text" -> "A%20Text"
    func addingPercentEncoding() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
    }
}
