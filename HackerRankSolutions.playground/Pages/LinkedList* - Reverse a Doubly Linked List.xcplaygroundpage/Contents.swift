//: # Reverse a DoublyLinkedList
class Node {
    let value: Int
    var next: Node?
    weak var prev: Node?
    
    init(_ value: Int) {
        self.value = value
    }
}

class LinkedList {
    
    private var head: Node?
    private var tail: Node?

    init() {}
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var first: Node? {
        return head
    }

    func append(_ value: Int) {
        let newLast = Node(value)
        
        if let oldLast = tail {
            oldLast.next = newLast
            newLast.prev = oldLast
        } else {
            head = newLast
        }
        
        tail = newLast
    }
}
//: Helpers
extension LinkedList {
    convenience init(_ values: Int...) {
        self.init()
        for value in values {
            append(value)
        }
    }
}
//: ## String Description
extension LinkedList: CustomStringConvertible {
    // Print LinkedList as a String for debugging.
    var description: String {
        var result: String = "List: "
        
        var node = head
        while let n = node {
            result += "\(n.value) - "
            node = n.next
        }
        
        return result
    }
    
    // Description, but starting from the tail Node
    func descriptionFromLast() -> String {
        var result: String = ""
        var node = tail
        while let n = node {
            result = "\(n.value) - " + result
            node = n.prev
        }
        return result
    }
    
    func descriptionRecursive() -> String {
        func result(from node: Node?) -> String {
            guard let node = node else {
                return ""
            }
            
            return "\(node.value) - " + result(from: node.next)
        }
        
        return result(from: head)
    }
    
    func descriptionTailRecursive() -> String {
        func description(from node: Node?, acc: String) -> String {
            guard let node = node else {
                return acc
            }
            
            return description(from: node.next, acc: acc + "\(node.value) - ")
        }
        
        return description(from: head, acc: "")
    }
}
//: ## Other Methods
extension LinkedList {
    /// Computed property to iterate through the linked list and return the total number of nodes
    var count: Int {
        var c = 0
        var next = head
        while let current = next {
            c += 1
            next = current.next
        }
        return c
    }
    
    func removeFirst(value: Int) -> Node? {
        guard let nodeToRemove = firstNode(with: value) else {
            return nil
        }
        
        let next = nodeToRemove.next
        let prev = nodeToRemove.prev
        prev?.next = next
        next?.prev = prev
        
        if head === nodeToRemove {
            head = next
        }
        if tail === nodeToRemove {
            tail = prev
        }
        
        return nodeToRemove
    }
    
    func firstNode(with value: Int) -> Node? {
        var next = head
        while let current = next {
            if current.value == value {
                return current
            }
            next = current.next
        }
        return next
    }
    
    func removeAll() {
        head = nil
        tail = nil
    }
    
    /// Function to return the node at a specific index. Crashes if index is out of bounds (0...self.count)
    ///
    /// - Parameter index: Integer value of the node's index to be returned
    /// - Returns: Optional LinkedListNode
    func node(at index: Int) -> Node? {
        guard index >= 0 else {
            return nil
        }

        var current = head
        for _ in 0..<index {
            if current == nil { return nil }
            current = current?.next
        }
        return current
    }
    
    /// Subscript function to return the node at a specific index
    ///
    /// - Parameter index: Integer value of the requested value's index
    subscript(index: Int) -> Int {
        let node = self.node(at: index)
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
        tail = head
        
        var next = head
        while let current = next {
            next = current.next
            swap(&current.next, &current.prev)
            head = current
        }
    }
    
    // Method B: Reverse a linked list. Non-mutating.
    func reversed() -> LinkedList {
        let reversedList = LinkedList()
        var currentHead = head
        
        while (currentHead != nil) {
            // Add a new node to the reversedList, using the value from the head of the old list
            if let newValue = currentHead?.value {
                let newHead = Node(newValue)
                
                reversedList.head?.prev = newHead
                newHead.next = reversedList.head
                reversedList.head = newHead
            }
            
            // Remove the head from current list
            currentHead = currentHead?.next
        }
        
        return reversedList
    }
}
//: ## Execute
var list = LinkedList()
list.append(10)
list.append(11)
list.append(12)
list.append(13)
list.count

list.reversed() // non-mutating
list

list.reverse()  // mutating reverse for HackerRank
list.description
list.descriptionFromLast()
list.descriptionRecursive()
list.descriptionTailRecursive()

list.firstNode(with: 2)
list.firstNode(with: 10)?.value
list.firstNode(with: 12)?.value
list.firstNode(with: 13)?.value

var list2 = LinkedList(10, 11, 12, 13)
list2.removeFirst(value: 10)?.value
list2
list2.removeFirst(value: 10)?.value
list2
list2.removeFirst(value: 12)?.value
list2
list2.removeFirst(value: 13)?.value
list2
list2.removeFirst(value: 11)?.value
list2

var list3 = LinkedList(10, 11, 12, 13)
list3.node(at: -1)?.value
list3.node(at: 0)?.value
list3.node(at: 1)?.value
list3.node(at: 2)?.value
list3.node(at: 3)?.value
list3.node(at: 4)?.value
