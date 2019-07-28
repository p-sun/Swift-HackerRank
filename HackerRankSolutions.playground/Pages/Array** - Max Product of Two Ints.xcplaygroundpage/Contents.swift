//: Given an integer array of length 2+, return the greatest product of any of the two numbers.

//: ---
//: Method A - Brute Force O(N^2)
func greatestProductBruteForce(_ array: [Int]) -> Int {
    assert(array.count >= 2)

    var greatestProduct = Int.min
    for i in 0 ..< array.count {
        for j in i + 1 ..< array.count {
            greatestProduct = max(greatestProduct, array[i] * array[j])
        }
    }
    
    return greatestProduct
}

greatestProductBruteForce([2, 6, 2, -10, -20, 3, 5])
greatestProductBruteForce([2, 6, 2, -10, -20, 300, 5])

//: ---
//: Method B - Iterative O(n), looping only once through the elements.
func greatestProduct(_ array: [Int]) -> Int {
    assert(array.count >= 2)
    
    var largest = array.first!
    var smallest = array.first!
    
    var greatestProduct = Int.min
    
    for (i, e) in array.enumerated() {
        if i == 0 { continue }
        
        if e >= largest {
            greatestProduct = e * largest
            largest = e
        } else if e <= smallest {
            greatestProduct = e * smallest
            smallest = e
        }
    }
    
    return greatestProduct
}

assert(greatestProduct([2, 6, 2, -10, -20, 3, 5]) == 200)  // Some + some -
assert(greatestProduct([2, 6, 2, -10, -20, 300, 5]) == 1800) // Some + some -
assert(greatestProduct([-1, 2]) == -2)// Only two integers
assert(greatestProduct([-1, -2, -23, -73]) == 1679) // All negative
assert(greatestProduct([1, 2, 23, 73]) == 1679) // All positive
assert(greatestProduct([1, 2, 20, 20]) == 400) // Two repeated values
