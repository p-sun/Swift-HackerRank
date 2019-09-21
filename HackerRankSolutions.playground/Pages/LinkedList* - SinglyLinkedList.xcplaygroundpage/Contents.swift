/*:
 # LinkedList
 */
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
    
    func append(value: Int) {
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
    
    func removeFirst(value: Int) -> Node? {
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
//: ## Execute
let list = LinkedList()

list.append(value: 6)
list.append(value: 7)
list.append(value: 8)

list.removeFirst(value: 9)
list.removeFirst(value: 6)
list.removeFirst(value: 7)
list.removeFirst(value: 8)
