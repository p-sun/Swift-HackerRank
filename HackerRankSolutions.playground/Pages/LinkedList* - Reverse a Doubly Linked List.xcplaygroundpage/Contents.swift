// Reverse a LinkedList
// Methods are at the end of this Playground.
// (This is not available in Swift on HackerRank yet.)

import Foundation

//: ## Define a Linked List
class LinkedList<T> {
    open class LinkedListNode<T> {
        var value: T
        var next: LinkedListNode?
        weak var previous: LinkedListNode?
        
        public init(value: T) {
            self.value = value
        }
    }
    
    public typealias Node = LinkedListNode<T>
    
    fileprivate var head: Node?
    
    public init() {}
    
    open var isEmpty: Bool {
        return head == nil
    }
    
    open var first: Node? {
        return head
    }
    
    open var last: Node? {
        guard var node = head else {
            return nil
        }
        
        while case let next? = node.next {
            node = next
        }
        return node
    }
    
    /// Append a value to the end of the list
    ///
    /// - Parameter value: The data value to be appended
    open func append(_ value: T) {
        let newNode = Node(value: value)
        self.append(newNode)
    }
    
    open func append(_ node: Node) {
        let newNode = LinkedListNode(value: node.value)
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
}

//: ## Other Linked List Methods
extension LinkedList {
    // Print LinkedList as a String for debugging.
    public var description : String {
        var values: String = ""
        
        var node = head
        while let currentValue = node?.value {
            values = values + "\(currentValue)" + " - "
            node = node?.next
        }
        
        return values
    }
    
    /// Computed property to iterate through the linked list and return the total number of nodes
    open var count: Int {
        if var node = head {
            var c = 1
            while case let next? = node.next {
                node = next
                c += 1
            }
            return c
        } else {
            return 0
        }
    }
    
    /// Function to return the node at a specific index. Crashes if index is out of bounds (0...self.count)
    ///
    /// - Parameter index: Integer value of the node's index to be returned
    /// - Returns: Optional LinkedListNode
    open func node(atIndex index: Int) -> Node? {
        if index >= 0 {
            var node = head
            var i = index
            while node != nil {
                if i == 0 { return node }
                i -= 1
                node = node!.next
            }
        }
        return nil
    }
    
    /// Subscript function to return the node at a specific index
    ///
    /// - Parameter index: Integer value of the requested value's index
    open subscript(index: Int) -> T {
        let node = self.node(atIndex: index)
        assert(node != nil)
        return node!.value
    }
}

//: ## Reverse a Linked List
extension LinkedList {
    // Method A - Reverse a linked list. Mutating.
    // Note that we use 3 pointers (nextNode, currentNode, and head)
    // to prevent ARC from garbage collecting nodes while we move the pointers around.
    func reverse() {
        var nextNode = head
        
        while let currentNode = nextNode {
            nextNode = currentNode.next
            swap(&currentNode.next, &currentNode.previous)
            head = currentNode
        }
    }
    
    // Method B: Reverse a linked list. Non-mutating.
    func reversed() -> LinkedList<T> {
        let reversedList = LinkedList<T>()
        var currentHead = head
        
        while (currentHead != nil) {
            // Add a new node to the reversedList, using the value from the head of the old list
            if let newValue = currentHead?.value {
                let newHead = Node(value: newValue)
                
                reversedList.head?.previous = newHead
                newHead.next = reversedList.head
                reversedList.head = newHead
            }
            
            // Remove the head from current list
            currentHead = currentHead?.next
        }
        
        return reversedList
    }
}

// Execute reverse.
var list = LinkedList<Int>()
list.append(10)
list.append(11)
list.append(12)
list.append(13)

list.reversed() // non-mutating
list

list.reverse()  // mutating reverse for HackerRank
list
