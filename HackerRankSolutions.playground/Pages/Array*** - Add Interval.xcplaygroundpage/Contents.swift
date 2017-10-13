/*:
 Given a collection of sorted intervals with no overlapping intervals, add a new interval.
 
 - Given [1,3],[2,6],[8,10],[15,18],
 - Return [1,6],[8,10],[15,18].
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
 - Easy to read but slower because we append each interval into the results array.
 */
func addIntervalA(_ new: Interval, to intervals: inout [Interval]) {
    var results = [Interval]()
    var new = new
    var appendedNew = false
    
    for interval in intervals {
        // Current interval is BEFORE the new interval
        if interval.end < new.start {
            results.append(interval) }
            
        // Current interval is AFTER the new interval
        else if interval.start > new.end {
            if !appendedNew {
                results.append(new)
                appendedNew = true
            }
            results.append(interval) }
            
        // Current interval intercepts new interval
        else {
            new.start = min(new.start, interval.start)
            new.end = max(new.end, interval.end)
        }
    }
    
    if !appendedNew {
        results.append(new)
    }
    
    intervals = results
}

/*:
 # Method B - Faster
 - Uses flags so it either inserts or replaces the new interval into the array of intervals ONCE.
 - Con: Harder to read
 - Pro: Faster than Method A. Method B used 62s, Method A used 96s.
 */
func addInterval(_ new: Interval, to intervals: inout [Interval]) {
    var new = new
    
    var i = 0
    var j = 0
    var newOverlaps = false
    
    for (index, current) in intervals.enumerated() {
        // If current interval is BEFORE new interval, increment i (index to insert the new interval).
        if current.end < new.start {
            i = index + 1 }
            
        // If current interval is AFTER new, do nothing.
        else if current.start > new.end { }
            
        // If current interval OVERLAPS with new
        else {
            // And it's the first interval to overlap with new,
            // Merge current with new, and use i & j to track which indices of intervals to replace.
            if !newOverlaps {
                i = index
                j = index
                new.start = min(new.start, current.start)
                newOverlaps = true
                
            } else {
                j = index
            }
            
            new.end = max(new.end, current.end)
        }
    }
    
    if newOverlaps {
        intervals.replaceSubrange(i...j, with: [new])
    } else {
        intervals.insert(new, at: i)
    }
}
//: ## Tests
// Non-overlapping interval inserted at beginning
var array3 = [Interval(5,10), Interval(15,20), Interval(25,35)]
addInterval(Interval(0, 3), to: &array3)
assert(array3.description == "[(0, 3), (5, 10), (15, 20), (25, 35)]")

// Non-overlapping interval inserted in the middle
var array = [Interval(5,10), Interval(15,20), Interval(25,35)]
addInterval(Interval(21, 23), to: &array)
assert(array.description == "[(5, 10), (15, 20), (21, 23), (25, 35)]")

// Non-overlapping interval inserted at end
var array4 = [Interval(5,10), Interval(15,20), Interval(25,35)]
addInterval(Interval(36, 50), to: &array4)
assert(array4.description == "[(5, 10), (15, 20), (25, 35), (36, 50)]")

// Overlaps 1 interval
var array2 = [Interval(5,10), Interval(15,20), Interval(25,35)]
addInterval(Interval(15, 23), to: &array2)
assert(array2.description == "[(5, 10), (15, 23), (25, 35)]")

// Overlaps 2 intervals
var array5 = [Interval(5,10), Interval(15,20), Interval(25,35), Interval(40, 45)]
addInterval(Interval(15, 25), to: &array5)
assert(array5.description == "[(5, 10), (15, 35), (40, 45)]")

// Overlaps 3 intervals
var array6 = [Interval(5,10), Interval(15,20), Interval(25,35), Interval(40, 45)]
addInterval(Interval(15, 40), to: &array6)
assert(array6.description == "[(5, 10), (15, 45)]")

// Overlaps all intervals
var array7 = [Interval(5,10), Interval(15,20), Interval(25,35), Interval(40, 45)]
addInterval(Interval(10, 40), to: &array7)
assert(array7.description == "[(5, 45)]")

// Is greater than all intervals
var array8 = [Interval(5,10), Interval(15,20), Interval(25,35), Interval(40, 45)]
addInterval(Interval(0, 50), to: &array8)
assert(array8.description == "[(0, 50)]")
