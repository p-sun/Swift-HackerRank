//: ## Bit Vector
//: A bit vector struct that tracks whether it contains a letter or not

struct BitVector {
    private var vector: UInt32 = 0
    
    func contains(_ c: Character) -> Bool {
        guard let mask = charMask(c) else { return false }
        return vector & mask != 0
    }
    
    mutating func insert(_ c: Character) {
        guard let mask = charMask(c) else { return }
        vector |= mask
    }
    
    mutating func remove(_ c: Character) {
        guard let mask = charMask(c) else { return }
        vector &= ~mask
    }
    
    mutating func toggle(_ c: Character) {
        guard let mask = charMask(c) else { return }
        vector ^= mask
    }
    
    private func charMask(_ c: Character) -> UInt32? {
        guard c.isLetter else { return nil }
        guard let aAscii = Character("a").asciiValue,
            let cAscii = c.lowercased().first?.asciiValue else {
                return nil
        }
        let cIndex = cAscii - aAscii
        return UInt32(1) << cIndex
    }
}

extension BitVector: CustomStringConvertible {
    var description: String {
        return String(vector, radix: 2)
    }
}

var v = BitVector()
assert(v.contains("a") == false)
assert(v.contains("#") == false)

v.insert("a")
v.insert("h")
assert(v.contains("a") == true)
assert(v.contains("b") == false)
assert(v.contains("h") == true)
assert(v.contains("#") == false)

v.toggle("a")
assert(v.description == "10000000")
v.toggle("b")
assert(v.description == "10000010")
v.toggle("h")
assert(v.description == "10")

v.remove("h")
assert(v.description == "10")
v.remove("b")
assert(v.description == "0")
