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
    private var last: Node?

    init() {}
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var first: Node? {
        return head
    }

    func append(_ value: Int) {
        let newLast = Node(value)
        
        if let oldLast = last {
            oldLast.next = newLast
            newLast.prev = oldLast
        } else {
            head = newLast
        }
        
        last = newLast
    }
}
//: ## Other Linked List Methods
extension LinkedList: CustomStringConvertible {
    // Print LinkedList as a String for debugging.
    var description: String {
        var result: String = ""
        
        var node = head
        while let n = node {
            result += "\(n.value) - "
            node = n.next
        }
        
        return result
    }
    
    // Description, but starting from the last Node
    func descriptionFromLast() -> String {
        var result: String = ""
        var node = last
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
    
    /// Function to return the node at a specific index. Crashes if index is out of bounds (0...self.count)
    ///
    /// - Parameter index: Integer value of the node's index to be returned
    /// - Returns: Optional LinkedListNode
    func node(atIndex index: Int) -> Node? {
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
    subscript(index: Int) -> Int {
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
        last = head
        
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

// Execute reverse.
var list = LinkedList()
list.append(10)
list.append(11)
list.append(12)
list.append(13)

list.reversed() // non-mutating
list

list.reverse()  // mutating reverse for HackerRank
list
list.descriptionFromLast()
list.descriptionRecursive()
list.descriptionTailRecursive()

list.count
