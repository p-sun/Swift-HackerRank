/*: Rotate Left
 \
 [HackerRank](https://www.hackerrank.com/challenges/ctci-array-left-rotation/problem)
 \
 Rotate an array by d positions to the left.
 
 Given Constraints: rotateBy >= 0
 
  1 2 3 4 5    -- rotateBy 2 -->    4 5 1 2 3
 \
  1 2 3 4 5    -- rotateBy 7 -->    4 5 1 2 3
*/

func rotLeft(a: [Int], d: Int) -> [Int] {
    guard d > 0 else {
        return a
    }
    let count = a.count
    let rotateBy = d % count
    return Array(a[rotateBy...count-1])
         + Array(a[0...rotateBy - 1])
}

assert(rotLeft(a: [1, 2, 3, 4, 5], d: 1)
    == [2, 3, 4, 5, 1])
assert(rotLeft(a: [1, 2, 3, 4, 5], d: 2)
    == [3, 4, 5, 1, 2])
assert(rotLeft(a: [1, 2, 3, 4, 5], d: 4)
    == [5, 1, 2, 3, 4])
assert(rotLeft(a: [33,47,70,37,8,53,13,93,71,72,51,100,60,87,97], d: 13)
    == [87,97,33,47,70,37,8,53,13,93,71,72,51,100,60])
