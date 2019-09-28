//: ## Heap
struct MinHeap<T: Comparable> {
    private var nodes = [T]()
    
    // MARK: - Public
    func peek() -> T? {
        return nodes.first
    }
    
    mutating func insert(_ value: T) {
        nodes.append(value)
        bubbleUp(index: nodes.count - 1)
    }
    
    mutating func pop() -> T? {
        guard let first = nodes.first else { return nil }
        swapAt(0, nodes.count - 1)
        nodes.removeLast()
        bubbleDown(index: 0)
        return first
    }
    
    // MARK: - Private Heap Maintainence
    
    // Reorders node at index so that the max-heap or min-heap property still holds
    private mutating func bubbleUp(index i: Int) {
        let parentI = parentIndex(of: i)
        if let current = node(at: i), let parent = node(at: parentI), current < parent {
            swapAt(i, parentI)
            bubbleUp(index: parentI)
        }
    }
    
    // Reorders node at index so that the max-heap or min-heap property still holds
    private mutating func bubbleDown(index i: Int) {
        guard let current = node(at: i) else { return }
        
        var minIndex = i // Index of the smallest node
        var minNode = current // Value of the smallest node
        if let left = node(at: leftChildIndex(of: i)), left < minNode {
            minIndex = leftChildIndex(of: i)
            minNode = left
        }
        if let right = node(at: rightChildIndex(of: i)), right < minNode {
            minIndex = rightChildIndex(of: i)
        }
        
        guard i != minIndex else { return }
        swapAt(i, minIndex)
        bubbleDown(index: minIndex)
    }
    
    // MARK: - Public Index
    func node(at i: Int) -> T? {
        guard isValidIndex(i) else { return nil }
        return nodes[i]
    }
    
    // MARK: - Private Index
    private func isValidIndex(_ i: Int) -> Bool {
        return i >= 0 && i < nodes.count
    }

    private func parentIndex(of i: Int) -> Int {
        return (i - 1) / 2
    }
    
    private func leftChildIndex(of i: Int) -> Int {
        return (i * 2) + 1
    }

    private func rightChildIndex(of i: Int) -> Int {
        return (i * 2) + 2
    }
    
    //MARK: - Private
    private mutating func swapAt(_ i: Int, _ j: Int) {
        nodes.swapAt(i, j)
    }
}

extension MinHeap: CustomStringConvertible {
    var description: String {
        return "Heap: \(nodes)"
    }
}

var heap = MinHeap<Int>()
heap.node(at: 0) == nil
heap.peek()

heap.insert(8)
heap.insert(3)
heap.insert(9)
heap.insert(2)

heap.peek()

heap.pop()
heap
heap.pop()
heap
heap.pop()
heap
heap.pop()
heap
heap.pop()
heap
