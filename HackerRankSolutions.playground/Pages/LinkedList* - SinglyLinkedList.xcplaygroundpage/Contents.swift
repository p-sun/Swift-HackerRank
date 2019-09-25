/*:
 # LinkedList
 */
import XCTest
import Foundation
class Node {
    let value: Int
    var next: Node?
    
    init(_ value: Int) {
        self.value = value
        self.next = nil
    }
}

class LinkedList {
    var head: Node?
    
    func insert(_ value: Int) {
        let newNode = Node(value)

        guard let head = head else {
            self.head = newNode
            return
        }
        
        var node = head
        while let next = node.next {
            node = next
        }
        node.next = newNode
    }
}
//: ## Helpers
extension LinkedList {
    convenience init(_ values: Int...) {
        self.init()
        for value in values {
            insert(value)
        }
    }
}
//: ## Print Debugs
extension LinkedList: CustomStringConvertible {
    
    var description: String {
        var result: String = "List: "

        var node = head
        while let n = node {
            result += "\(n) -> "
            node = n.next
        }

        return result
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        return "(\(value))"
    }
}
//: ## Remove First
extension LinkedList {
    func removeFirst(_ value: Int) -> Node? {
        var node = head
        while let currentValue = node?.value {
            if currentValue == value {
                return node
            }
            node = node?.next
        }
        
        return nil
    }
}

var list = LinkedList(6, 7, 8)
list.removeFirst(9)
list.removeFirst(6)
list.removeFirst(7)
list.removeFirst(8)
//: ## Remove Duplicates
//: CTCI 2.1
extension LinkedList {
    
    // Remove duplicates:
    // CHECK next node, and track current node
    //   * var current node -- Use this to REMOVE the next node
    //   * let n (next) node -- CHECK if we need to remove this node
    func removeDuplicatesCheckingNextNode() {
        guard let head = head else { return }
        
        var valuesSoFar = Set<Int>()
        valuesSoFar.insert(head.value)

        var current = head
        while let n = current.next {
            if valuesSoFar.contains(n.value) {
                current.next = n.next // <-----
            } else {
                valuesSoFar.insert(n.value)
                current = n // <-----
            }
        }
    }

    // Remove duplicates where we:
    // CHECK current node, and track previous node
    //   * var previous node -- Use this to REMOVE the next node
    //   * var current node -- Iterate using this node
    //   * let c (current) node -- CHECK if we need to remove this node
    // Compared with removeDuplicatesCheckingNextNode():
    //    Con: More verbose b/c it requires one more variable (var prev: Node?)
    //    Pro: removeDuplicatesCheckingCurrentNode() can check and remove CURRENT node, whereas the removeDuplicatesCheckingNextNode() can only check and remove NEXT node, which means it can't remove head nodes. For this use case of removing duplicates, removeDuplicatesCheckingNextNode() is better b/c we don't need to ever remove the head node. For problems like 'partition', where we need to remove the head node, we must check and the remove current node.
    func removeDuplicatesCheckingCurrentNode() {
        guard let head = head else { return }
        
        var set = Set<Int>()
        set.insert(head.value)
        
        var prev: Node? // <-----
        var current: Node? = head
        while let c = current {
            if set.contains(c.value) {
                prev?.next = c.next // <-----
            } else {
                set.insert(c.value)
                prev = current // <-----
            }
            current = c.next // <-----
        }
    }
    
    func removeDuplicatesWithoutBuffer() {
        var current = head
        
        while let c = current {
            
            var runner = c
            while let n = runner.next {
                if c.value == n.value {
                    runner.next = n.next
                } else {
                    runner = n
                }
            }
            
            current = c.next
        }
    }
    
    // If our linked List conformed to Sequence,
    // then we can use `func reduce` like this
//    func removeDuplicatesRecusive() {
//        var set = Set<Int>()
//        let list = reduce(LinkedList()) { result, e in
//            guard !set.contains(e) else { return result }
//            set.insert(e)
//            result.insert(e)
//            return result
//        }
//        return list.reversed()
//    }
}

list = LinkedList(6, 7, 8, 9, 8, 8, 6)
list.removeDuplicatesCheckingNextNode()
XCTAssertEqual(list.description, "List: (6) -> (7) -> (8) -> (9) -> ")

list = LinkedList(6, 7, 8, 9, 8, 8, 6)
list.removeDuplicatesWithoutBuffer()
XCTAssertEqual(list.description, "List: (6) -> (7) -> (8) -> (9) -> ")

list = LinkedList(6, 7, 8, 9, 8, 8, 6)
list.removeDuplicatesCheckingCurrentNode()
XCTAssertEqual(list.description, "List: (6) -> (7) -> (8) -> (9) -> ")
//: ## Kth From End
//: CTCI 2.2
extension LinkedList {
    /// Return value kth elements from the end -- Iterative (Best solution)
    func value(fromEnd k: Int) -> Int? {
        guard k >= 0 else { return nil }
        
        // Move end k nodes into the list
        var end = head
        for _ in 0..<k {
            end = end?.next
        }
        
        // Out of bounds b/c the list is smaller than k + 1
        guard end != nil else { return nil }
        
        // start is k nodes before end
        var start = head
        // Move start and end at the same pace, until end can't moved anymore
        while let next = end?.next {
            end = next
            start = start?.next
        }
        
        return start?.value
    }
    
    /// Print value kth elements from the end -- Recursive
    func printKth(fromEnd k: Int) {
        func printKth(startAt node: Node?) -> Int {
            guard let node = node else { return 0 }
            
            let index = printKth(startAt: node.next)
            if index == k {
                print("Value \(k) from end is \(node)")
            }
            return index + 1
        }
        
        guard k >= 0 else {
            print("Value \(k) is smaller than 0")
            return
        }
        
        _ = printKth(startAt: head)
    }
    
    /// RETURN value kth elements from the end -- Recursive
    /// Same logic as printKth
    func valueRecursive(fromEnd k: Int) -> Int? {
        func nodeAndIndexFromEnd(startAt start: Node?) -> (Node?, Int) {
            guard let start = start else { return (nil, 0) }
            
            let (nodeKFromEnd, kFromEnd) = nodeAndIndexFromEnd(startAt: start.next)
            if let nodeKFromEnd = nodeKFromEnd {
                return (nodeKFromEnd, kFromEnd)
            }
            if kFromEnd == k {
                return (start, kFromEnd + 1)
            }
            return (nil, kFromEnd + 1)
        }
        
        let (node, _) = nodeAndIndexFromEnd(startAt: head)
        return node?.value
    }
}

list = LinkedList(5, 6, 7, 8)
XCTAssertEqual(list.value(fromEnd: -1), nil)
XCTAssertEqual(list.value(fromEnd: 0), 8)
XCTAssertEqual(list.value(fromEnd: 1), 7)
XCTAssertEqual(list.value(fromEnd: 2), 6)
XCTAssertEqual(list.value(fromEnd: 3), 5)
XCTAssertEqual(list.value(fromEnd: 4), nil)

list.printKth(fromEnd: -1)
list.printKth(fromEnd: 0)
list.printKth(fromEnd: 1)
list.printKth(fromEnd: 2)
list.printKth(fromEnd: 3)
list.printKth(fromEnd: 4)

XCTAssertEqual(list.valueRecursive(fromEnd: -1), nil)
XCTAssertEqual(list.valueRecursive(fromEnd: 0), 8)
XCTAssertEqual(list.valueRecursive(fromEnd: 1), 7)
XCTAssertEqual(list.valueRecursive(fromEnd: 2), 6)
XCTAssertEqual(list.valueRecursive(fromEnd: 3), 5)
XCTAssertEqual(list.valueRecursive(fromEnd: 4), nil)
/*:
 ## Partition
 CTCI 2.4
 
 Partition a singly linked list around a value `x`, such that all nodes `< x` come before all nodes `>= x`.
 
 If x is contained in the list, x only needs to be after the elements less than x.
 The partition element can appear anywhere in the "right partition"; it does not need to appear between the left and right partitions — e.g.:
 
 Input:    `3 -> 5 -> 8 -> 5 -> 10 -> 2 -> 1`  (partition = 5) \
 Output: `3 -> 1 -> 2 -> 10 -> 5 -> 5 -> 8`
 */
extension LinkedList {
    func partition(at k: Int) {
        guard let head = head else { return }
        
        var newHead = head
        var tail = head
        var current: Node? = head
        
        while let c = current {
            let next = c.next
            if c.value < k {
                // Insert node at head
                c.next = newHead
                newHead = c
            } else {
                // Insert node at tail
                tail.next = c
                tail = c
            }
            current = next
        }
        
        tail.next = nil
        self.head = newHead
    }
}

list = LinkedList(3, 5, 8, 10, 2, 6)
list.partition(at: 5)

list = LinkedList(3, 5, 8, 2)
list.partition(at: 5)

list = LinkedList(5, 3, 8, 2)
list.partition(at: 5)

list = LinkedList(1, 2, 3, 5)
list.partition(at: 5)

list = LinkedList(5, 1, 2, 3)
list.partition(at: 5)

list = LinkedList(1, 5, 2, 3)
list.partition(at: 5)

list = LinkedList(1, 2, 5, 3)
list.partition(at: 5)
