/*:
 Given a collection of intervals, merge all overlapping intervals. | Medium | [LeetCode](https://leetcode.com/problems/merge-intervals/description/)
 - Given [1,3],[2,6],[8,10],[15,18]
 - Return [1,6],[8,10],[15,18]
 */
struct Interval {
    var start: Int
    var end: Int
    
    init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}

extension Interval: CustomStringConvertible {
    public var description: String {
        return "(\(start), \(end))"
    }
}
/*:
 # Method A
- For every interval
    - If CURRENT is after NEW, append NEW. Increment NEW.
    - Else, merge CURRENT into NEW
- Append the last NEW
 */
func merge(_ intervals: [Interval]) -> [Interval] {
    guard intervals.count > 1 else { return intervals }
    
    let intervals = intervals.sorted(by: { $0.start < $1.start })
    var results = [Interval]()
    var merged = intervals.first!
    
    for current in intervals {
        if current.start > merged.end {
            results.append(merged)
            merged = current
        } else {
            merged.end = max(current.end, merged.end)
        }
    }
    
    results.append(merged)
    
    return results
}
//: # Tests
// Empty intervals
let r2 = merge([])
assert(r2.description == "[]")

//// One interval
let r1 = merge([Interval(5,10)])
assert(r1.description == "[(5, 10)]")

//// Several non-overlapping intervals not in order
let r0 = merge([Interval(5,10), Interval(0, 3), Interval(25,35), Interval(15,20)])
assert(r0.description == "[(0, 3), (5, 10), (15, 20), (25, 35)]")

// 1 overlapping interval
var r3 = merge([Interval(5, 10), Interval(15, 23), Interval(15, 20), Interval(25, 35)])
assert(r3.description == "[(5, 10), (15, 23), (25, 35)]")

// Overlaps 2 intervals
var i4 = [Interval(5,10), Interval(15,20), Interval(15, 25), Interval(25,35), Interval(40, 45)]
assert(merge(i4).description == "[(5, 10), (15, 35), (40, 45)]")

// Overlaps 3 intervals
var i5 = [Interval(5,10), Interval(15, 40), Interval(15,20), Interval(25,35), Interval(40, 45)]
assert(merge(i5).description == "[(5, 10), (15, 45)]")

// Overlaps all intervals
var i6 = [Interval(10, 40), Interval(5,10), Interval(15,20), Interval(25,35), Interval(40, 45)]
assert(merge(i6).description == "[(5, 45)]")

// Is greater than all intervals
var i7 = [Interval(0, 50), Interval(5,10), Interval(15,20), Interval(25,35), Interval(40, 45)]
assert(merge(i7).description == "[(0, 50)]")
