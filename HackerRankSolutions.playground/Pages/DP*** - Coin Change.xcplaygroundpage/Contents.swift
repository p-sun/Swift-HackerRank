 /*:
  ## Coin Change
  \
  Hard | [HackerRank](https://www.hackerrank.com/challenges/ctci-coin-change/problem) |  CTCI🌟
  \
  Given a target dollars amount, and a list of dollar values for distinct coins, print the number of ways you can make change for n dollars if each coin is available in an infinite quantity.
  \
  \
  e.g. Given `coins: [1, 3]` and `target: 6`. There are 3 combinations: 1+1+1+1+1+1, 1+1+1+3, and 3+3.
  \
  \
  Start with coins of value 1. There is one combintion to make each target value from 0...6.
  
    [1, 1, 1, 1, 1, 1, 1]

  Now look at combinations using coins of value 1 and 3.
  * No new combinations can be made with target i of 1...2.
  * At target i = 3, combinations[3] = combinations[3] + combinations[0] = 1 + 1 = 2
  * combinations[3] = 1 is "one combination of value 1 coins to make target 3". i.e. 1+1+1
  * combinations[0] = 1 is "one combination of coins to make target 0". Thus, we can add a 'coin of value 3' to combinations[0] to make 1 new combination for combinations[3].
  
  
    [1, 1, 1, 2, 1, 1, 1]

  * At target i = 6, combinations[6] = combinations[6] + combinations[3] = 1 + 2 = 3.
  * combinations[6] = 1 is "1 combination of value 1 coins to make target 3". i.e. 1+1+1+1+1+1
  * combinations[3] = 2 is "2 combinations of value 1 & 3 coins to make target 3". i.e. 1+1+1 & 3
  * Thus, we can add a 'coin of value 3' to each combination at combinations[3] to make 2 new combinations for target 6. i.e. 1+1+1+3 and 3+3.
  
  
    [1, 1, 1, 2, 2, 2, 3]
  
*/
 func makeChange(coins: [Int], target: Int) -> Int {
    
    // Number of combinations that sums to the index value.
    var combinations = Array(repeating: 0, count: target + 1)
    
    // Base Case: There is 1 combination of coins to sum to 0. (i.e. 0 coins sum to 0)
    combinations[0] = 1
    
    // For each type of coin,
    for coin in coins {
        
        // For each sum value i from 1...target,
        for i in 1...target {
            if i >= coin {
        
                // combinations[i-coin] = For EVERY previous combination with a sum that is one coin value less than i, add the current coin to make a new combination summing to i.
                // combinations[i] = # of combinations using coins smaller than the current coin.
                combinations[i] = combinations[i] + combinations[i-coin]
            }
        }
    }
    
    return combinations[target]
 }
 
 makeChange(coins: [1, 3], target: 6)

// Get HackeRank Input
// let n = intArrayForLine()[0]
// let coins = intArrayForLine()
// print( makeChange(coins: coins, target: n))
