//: ## BubbleSort
extension Array where Element: Comparable {
    mutating func bubbleSort() {
        for i in 0..<count {
            for j in 1..<count - i {
                if self[j - 1] > self[j] {
                    swapAt(j - 1, j)
                }
            }
        }
    }
}

var arr = [2, 5, 7, -2, 33]
arr.bubbleSort()

arr = []
arr.bubbleSort()

arr = [3]
arr.bubbleSort()

arr = [3, 1]
arr.bubbleSort()
