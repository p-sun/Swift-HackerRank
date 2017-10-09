/*:
 # Fibonacci Numbers
 [HackerRank](https://www.hackerrank.com/challenges/ctci-fibonacci-numbers/problem)
 \
 Fibonacci is a sequence of numbers where each number is the sum of the two numbers before.
 \
 i.e.  0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, ...
 \
 Formally,    Fn = Fn-1 + Fn-2    where   F0 = 0 and F1 = 1.
 \
 ## Method A - Recursion
 \
 Slow because the time complexity is expotential: T(n) = T(n-1) + T(n-2).
 \
 For example, we calculate T(2) = T(1) + T(0) many times.
*/
func recursiveFibonacci(_ n: Int) -> Int {
    if n <= 1 {
        return n
    }
    
    return recursiveFibonacci(n - 1) + recursiveFibonacci(n - 2)
}
recursiveFibonacci(9) // 34

/*:
 ## Method B - More efficient - Memoization
 \
 Time complexity is O(n).
 */
func dpFibonacci(_ n: Int) -> Int {
    var memo = [Int]()
    memo.append(0) // F0 = 0
    memo.append(1) // F1 = 1
    
    guard n > 1 else {
        return memo[n]
    }
    
    for i in 2...n {
        memo.append(memo[i-1] + memo[i-2])
    }

    return memo[n]
}
dpFibonacci(9) // 34
dpFibonacci(1) // 1
