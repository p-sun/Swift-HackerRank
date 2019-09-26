//: ## Bitwise Operators
import Foundation
//: ## Integers
//: UInt8 --- 8-bit unsigned integer       0...255
let minUInt8 = UInt8("0", radix: 2)         // 0
assert(UInt8.min == minUInt8)

let maxUInt8 = UInt8("11111111", radix: 2)   // 255
assert(UInt8.max == maxUInt8)

let invalidUInt8 = UInt8("-1", radix: 2)                // nil
let invalidUInt8Big = UInt8("1000000000000", radix: 2)  // nil
//: Int --- signed 64-bit integer    (On a 64-bit platform)  // -2^23...2^23 - 1
Int.min // -9223372036854775808

let maxInt = NSDecimalNumber(decimal: pow(2, 63) - 1).intValue // 9223372036854775807
assert(Int.max == maxInt)
/*:
 ## Binary Convertion
 UInt8 is an unsigned Int that uses only 8 bits, so it can stored ints from 0 to 255.
 */
extension Int {
    func binaryString() -> String {
        if self < 2 {
            return String(self)
        }
        return (self / 2).binaryString().description
             + (self % 2).description
    }
}
extension String {
    func binaryNumber() -> Int {
        return Int(self, radix: 2)!
    }
}
5.binaryString()
"101".binaryNumber()
5.binaryString().binaryNumber()
/*:
 ## Operators
 */
//: Left Shift operator    <<
1 << 0 // 00000001 -> 1
1 << 1 // 00000010 -> 2
1 << 2 // 00000100 -> 4
1 << 3 // 00001000 -> 8
//: Right Shift operator    >>
8 >> 0
8 >> 1
8 >> 2
8 >> 3
//: AND operator    &           BOTH are 1s
UInt8("0101", radix: 2)! & UInt8("1100", radix: 2)! // 0100
UInt8("0101", radix: 2)! & UInt8("0101", radix: 2)! // 0101
("0101".binaryNumber() & "1100".binaryNumber()).binaryString()
("0101".binaryNumber() & "0101".binaryNumber()).binaryString()
("0101".binaryNumber() & "1010".binaryNumber()).binaryString()
//: OR operator    |            EITHER is a 1
("0101".binaryNumber() | "1010".binaryNumber()).binaryString()
//: XOR operator   ^            ODD NUMBER of 1s
("0101".binaryNumber() ^ "1111".binaryNumber()).binaryString()
("0101".binaryNumber() ^ "1010".binaryNumber()).binaryString()
/*:
 ## OptionSet
*/
struct Schedule: OptionSet {
    let rawValue: Int
    static let monday     = Schedule(rawValue: 1 << 0) // 1  - 00000001
    static let tuesday    = Schedule(rawValue: 1 << 1) // 2  - 00000010
    static let wednesday  = Schedule(rawValue: 1 << 2) // 4  - 00000100
    static let thursday   = Schedule(rawValue: 1 << 3) // 8  - 00001000
    static let friday     = Schedule(rawValue: 1 << 4) // 16 - 00010000
    static let saturday   = Schedule(rawValue: 1 << 5) // 32 - 00100000
    static let sunday     = Schedule(rawValue: 1 << 6) // 64 - 01000000
}
//: Initializing an OptionSet
let wedn: Schedule = .wednesday
assert(wedn.rawValue == 4)
assert(wedn.rawValue == Int("00000100", radix: 2))
//: Union of OptionSets
let tuesOrWed: Schedule = [.tuesday, .wednesday]
tuesOrWed.rawValue.binaryString()

let friOrSat: Schedule = Schedule.friday.union(Schedule.saturday)
friOrSat.rawValue.binaryString()
//: Checking if an OptionSet contains a certain element
assert(friOrSat.contains(.friday))
assert(!friOrSat.contains(.tuesday))
