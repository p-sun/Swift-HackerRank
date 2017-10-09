//: Given an integer array, return the greatest product of any of the two numbers.

//: ---
//: Method A - Brute Force O(N^2)
func greatestProductBruteForce(_ array: [Int]) -> Int? {
    guard array.count >= 2 else { return nil }
    
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
func greatestProduct(_ array: [Int]) -> Int? {
    guard array.count >= 2 else { return nil }
    
    var largest = array.first!
    var smallest = array.first!
    
    var greatestProduct = Int.min
    
    for (i, e) in array.enumerated() {
        if i == 0 { continue }
        
        let currentProduct = max(e * largest, e * smallest)
        if currentProduct > greatestProduct {
            greatestProduct = currentProduct
        }
        
        if e > largest {
            largest = e
        } else if e < smallest {
            smallest = e
        }
    }
    
    return greatestProduct
}

greatestProduct([2, 6, 2, -10, -20, 3, 5]) // Some + some -
greatestProduct([2, 6, 2, -10, -20, 300, 5]) // Some + some -
greatestProduct([-1, 2]) // Only two integers
greatestProduct([-1, -2, -23, -73]) // All negative
greatestProduct([1, 2, 23, 73]) // All positive
greatestProduct([1, 2, 20, 20]) // Two repeated values



