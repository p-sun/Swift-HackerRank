// Count the longest branch on a tree.

class Node {
    var left: Node?
    var right: Node?
    
    init(_ left: Node?, _ right: Node?) {
        self.left = left
        self.right = right
    }
}

func longestBranchCount(_ node: Node) -> Int {
    let leftCount: Int
    if let leftNode = node.left {
        leftCount = 1 + longestBranchCount(leftNode)
    } else {
        leftCount = 0
    }

    let rightCount: Int
    if let rightNode = node.right {
        rightCount = 1 + longestBranchCount(rightNode)
    } else {
        rightCount = 0
    }
    
    return max(leftCount, rightCount)
}
// 0
longestBranchCount(Node(nil, nil))

// 1
longestBranchCount(Node(
        Node(nil, nil
    ), nil))

// 1
longestBranchCount(Node(
        Node(nil, nil),
        Node(nil, nil)))

// 2
longestBranchCount(Node(
        Node(
            nil,
            Node(nil, nil)),
        Node(nil, nil)))

// 3
longestBranchCount(Node(
        Node(
            nil,
            Node(
                nil,
                Node(nil, nil))),
        Node(nil, nil)))
