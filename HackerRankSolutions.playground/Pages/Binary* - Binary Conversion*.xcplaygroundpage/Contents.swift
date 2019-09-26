/*:
 # Binary Conversion
  Convert from base 10 to base 2
 
 e.g. `binaryNumber(11) == "1011"`
 */
func binaryNumber(_ n: Int) -> String {
    if n < 2 {
        return String(n)
    }
    return binaryNumber(n / 2) + String(n % 2) // NOTE2
}

func binaryNumberTailRecursive(_ n: Int) -> String {
    func _binary(_ n: Int, result: String) -> String {
        print("n:", n, "   result:", result) // Note1!!! To debug tail recursion, print each call
        
        if n < 2 {
            print("final result:", String(n) + result) // Note1!!! and print the base case
            return String(n) + result
        }
        
        // NOTE2 !!! this is backwards from the tail recursive return
        return _binary(n / 2, result: String(n % 2) + result)
    }
    return _binary(n, result: "")
}

// FYI, Apple's way of calculating the binaryNumber string is faster
assert(binaryNumber(1066) == String(1066, radix: 2))

assert(binaryNumber(0) == "0")
assert(binaryNumber(1) == "1")
assert(binaryNumber(2) == "10")
assert(binaryNumber(3) == "11")
assert(binaryNumber(5) == "101")
assert(binaryNumber(11) == "1011")

assert(binaryNumber(1041) == "10000010001")
assert(binaryNumber(32) == "100000")

assert(binaryNumberTailRecursive(11) == "1011")

