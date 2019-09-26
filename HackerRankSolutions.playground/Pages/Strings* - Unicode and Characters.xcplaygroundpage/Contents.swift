//: ## Strings, Unicode, and Characters
import Foundation
//:  Loop though Characters in a String
for c in "HIJ" {
    print("Char \(c)")
}
//:  String -> [Character]   conversion
let charactersArray = "ABC".map{ $0 }
//: [Character] -> String   conversion
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
String(catCharacters)
/*:
 A Character has ONE asciiValue
 
 `var asciiValue: UInt8? { get }`
 */
let charA: Character = "A" // 65
charA.asciiValue
let charZ: Character = "Z" // 90
charZ.asciiValue
let chara: Character = "a" // 97
chara.asciiValue
let charz: Character = "z" // 122
charz.asciiValue
/*:
 ## Unicode Scalars
 * A Character (or a String) can be made of multiple Unicode scalars
 * A Unicode scalar value is a unique 21-bit number for a character or modifier, such as U+0061 for LATIN SMALL LETTER A ("a"), or U+1F425 for FRONT-FACING BABY CHICK ("🐥").
 */
//: uint32 -> Character
let chickUnicode = 0x1F425
let chickChar = Character(UnicodeScalar(chickUnicode)!) // 🐥
assert(chickChar.unicodeScalars.first?.value == 0x1F425)
//: String of Unicode -> Int -> Character
let chickUnicode2 = Int("1F425", radix: 16)!
let chickChar2 = Character(UnicodeScalar(chickUnicode)!) // 🐥
assert(chickChar2.unicodeScalars.first?.value == 0x1F425)
//: String of Unicode -> Character
let chickChar3 = Character("\u{1F425}") // 🐥
assert(chickChar3.unicodeScalars.first?.value == 0x1F425)
/*:
 ## Extended Grapheme Clusters
 * A Swift Character is one Extended Grapheme Cluster
 * Def: A single human-readable character, combined from a sequence of 1 or more Unicode scalars
 */
//: é can be one unicode scalar U+E9, or it can be combined from two unicode scalars U+65 (LATIN SMALL LETTER E) & U+301 (COMBINING ACUTE ACCENT)
let eAcute: Character = "\u{E9}"
let eAcuteScalars = eAcute.unicodeScalars.map { $0.description }
eAcuteScalars

let combinedEAcute: Character = "\u{65}\u{301}"
let combinedScalars = combinedEAcute.unicodeScalars.map { $0.description }
combinedScalars
UnicodeScalar(0x65)?.description // "e"
UnicodeScalar(0x301)?.description // "́"
//: Country Flags are made from two scalars
let canadaFlag: Character = "\u{1F1E8}\u{1F1E6}"
let canadaFlagScalars = canadaFlag.unicodeScalars.map { $0.description }
canadaFlagScalars

let usFlag: Character = "\u{1F1FA}\u{1F1F8}"

//: Some emojis can be made from 5 scalars!
let rainbowFlag: Character = "🏳️‍🌈"
let rainbowFlagScalars = rainbowFlag.unicodeScalars.map { $0.description }
rainbowFlagScalars
/*:
 ## Removing non-letters
 */
//: Trim off both ends of non-letters
"@#$ abCD !@#$ E ".trimmingCharacters(in: CharacterSet.letters.inverted)
//: Remove non-letters from full string 🌟 🌟 🌟 🌟 🌟
let cleanedString = "@#$ abCD !@#$ E ".filter { c in
    return c.description.rangeOfCharacter(from: CharacterSet.letters) != nil
}
/*:
 FYI. string.rangeOfCharacter(from: .letters)
 gets you the range of the first letter in the string
 Range is nil if no letters exist in the string
 */
let s1 = "A000"
let range1 = s1.rangeOfCharacter(from: CharacterSet.letters)!
"\(range1.lowerBound.utf16Offset(in: s1))..<\(range1.upperBound.utf16Offset(in: s1))"

let s2 = "0ABC0RRR0"
let range2 = s2.rangeOfCharacter(from: .letters)!
"\(range2.lowerBound.utf16Offset(in: s2))..<\(range2.upperBound.utf16Offset(in: s2))"

let s3 = "0000"
let range3 = s3.rangeOfCharacter(from: .letters)
range3
/*:
 ## Does a Character belong in a CharacterSet?
 */
extension CharacterSet {
    func contains(_ char: Character) -> Bool {
        guard char.unicodeScalars.count == 1,
            let firstScalar = char.unicodeScalars.first else {
                return false
        }
        return contains(firstScalar)
    }
}

let hChar: Character = "h"
CharacterSet.letters.contains(hChar)

let questionMark: Character = "?"
CharacterSet.letters.union(.punctuationCharacters).contains(hChar)
CharacterSet.letters.union(.punctuationCharacters).contains(questionMark)
