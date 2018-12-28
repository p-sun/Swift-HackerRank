/*:
# Count Cubes
Find all permutations of a^3 + b^3 = c^3 + d^3, where 1 <= a, b, c, d <= 100
*/
import Foundation

extension Int {
	func cubed() -> Int {
		return Int(pow(Double(self), 3))
	}
}

/**
Answer

My Assumptions:
- a <= b
- c <= d
- a != c
- b != d
*/

struct Pair: Equatable {
	let a: Int
	let b: Int
}

var pairs = [Int: [Pair]]()

for a in 1...100 {
	for b in a...100 {
		let sum = a.cubed() + b.cubed()
		
		let currentPair = Pair(a: a, b: b)
		let previousPairs = pairs[sum]

		if let previousPairs = previousPairs {
			for previousPair in previousPairs {
				print("sum: \(sum)    a: \(previousPair.a), b: \(previousPair.b), c: \(currentPair.a), d: \(currentPair.b)")
			}
		}

		pairs[sum] = (previousPairs ?? []) + [currentPair]
	}
}
