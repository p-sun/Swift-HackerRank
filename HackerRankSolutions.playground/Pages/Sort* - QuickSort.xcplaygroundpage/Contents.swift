//: ## Quicksort

func quickSort(_ arr: inout [Int]) {
    sort(&arr, low: 0, high: arr.count - 1)
}

/// Quick sort a subarray from index low...high
func sort(_ arr: inout [Int], low: Int, high: Int) {
    guard low < high else { return }
    
    let pivotIndex = (low + high) / 2
    let pivotElement = arr[pivotIndex]
    
    let partionIndex = partition(&arr, low: low, high: high, pivot: pivotElement)
    sort(&arr, low: low, high: partionIndex)
    sort(&arr, low: partionIndex + 1, high: high)
}

/// The array is partitioned into [low...p] and [p+1...high]
/// All elements in the left array <= the pivot.
/// All elements in the right array > the pivot.
/// Return p, the high index of the left array.
/// Note this may not be the pivot's index.
func partition(_ a: inout [Int], low: Int, high: Int, pivot: Int) -> Int {
    var i = low - 1
    var j = high + 1
    
    while true {
        repeat { i += 1 } while a[i] < pivot
        repeat { j -= 1 } while a[j] > pivot
        
        if i < j {
            a.swapAt(i, j)
        } else {
            return j
        }
    }
}

var arr = [3, 9, 7, 2, 5]
quickSort(&arr)

arr = [ 10, 0, 3, 9, 2, 14, 26, 27, 1, 5, 8, -1, 8 ]
quickSort(&arr)
