//
//  utils.swift
//  AoC
//
//  Created by Paul Landers on 11/8/18.
//

import Foundation

extension String {
    
    var length: Int {
        return self.count
    }
    
    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }
    
    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }
    
    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
    
    func integerArray(_ sep: Character) -> [Int] {
        return split(separator:sep).map { Int($0.trimmingCharacters(in: .whitespaces))! }
    }
    
    func stringArray(_ sep: Character) -> [String] {
        return split(separator:sep).map { String($0.trimmingCharacters(in: .whitespaces)) }
    }
    
    func lines() -> [String] {
        return self.stringArray("\n")
    }
    
    /// Format is a string with % where the numbers should be.
    /// If it doesnt match, nil will be returned
    /// A second, optional parameter allows specifying the wildcard character(s). Use a wildcard character that doesn't appear in the string
    func extract(format:String, wildcard :String = "%") -> [Int]? {
        let scanner = Scanner(string:self)
        scanner.charactersToBeSkipped = nil // the default here skips whitespace characters
        var skippers = format.components(separatedBy: wildcard)
        skippers.removeLast() // the last component here is after the final wildcard
        var intList = [Int]()
        for skipper in skippers {
            if skipper.count > 0 && !scanner.scanString(skipper, into: nil) {
                return nil
            }
            var thisInteger = 0
            if scanner.scanInt(&thisInteger) {
                intList.append(thisInteger)
            } else {
                return nil
            }
        }
        return intList
    }
}

extension Character {
    var asciiValue: UInt8 {
        return UInt8(ascii: self.unicodeScalars.first!)
    }
    var lowerCase: Character {
        let ascii = self.asciiValue
        if ascii >= 97 {
            return self
        }
        return Character(UnicodeScalar(ascii + 32))
    }
}

extension Date {
    func string(format:String) -> String {
        let f = DateFormatter()
        f.dateFormat = format
        return f.string(from: self)
    }
}

func squared(_ x: Int) -> Int {
    return x * x
}

func sqrti(_ x: Int) -> Int {
    return Int(sqrt(Double(x)))
}


class TicToc {
    var startTime :DispatchTime
    let name :String
    init(named: String) {
        startTime = DispatchTime.now()
        name = named
    }
    
    func start() {
        startTime = DispatchTime.now()
    }
    
    func end() {
        let nanoTime = DispatchTime.now().uptimeNanoseconds - startTime.uptimeNanoseconds
        let timeInterval = nanoTime / 1_000_000
        print("\(name) took \(timeInterval) ms")
    }
}

struct Stack<Element> {
    private var items = [Element]()
    var isEmpty :Bool { return items.count == 0 }
    var count :Int { return items.count }
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

enum Direction {
    case north
    case south
    case east
    case west
    
    var right :Direction {
        switch self {
        case .north: return .east
        case .south: return .west
        case .east: return .south
        case .west: return .north
        }
    }
    
    var left :Direction {
        switch self {
        case .north: return .west
        case .south: return .east
        case .east: return .north
        case .west: return .south
        }
    }
    
    var back :Direction {
        switch self {
        case .north: return .south
        case .south: return .north
        case .east: return .west
        case .west: return .east
        }
    }
}

struct Point :Hashable {
    let x :Int
    let y :Int
    
    static func ==(a:Point, b:Point) -> Bool { return a.x==b.x && a.y==b.y }
    
    func move(_ d:Direction) -> Point {
        switch d {
        case .north: return Point(x:x, y:y+1)
        case .south: return Point(x:x, y:y-1)
        case .east: return Point(x:x+1, y:y)
        case .west: return Point(x:x-1, y:y)
        }
    }
    
    init(_ x:Int, _ y:Int) {
        self.x = x
        self.y = y
    }
    init( x:Int,  y:Int) {
        self.x = x
        self.y = y
    }
    static func +(_ point:Point, _ additional:(x:Int,y:Int)) -> Point {
        return Point(point.x+additional.x,point.y+additional.y)
    }
    static func -(_ point:Point, _ additional:(x:Int,y:Int)) -> Point {
        return Point(point.x-additional.x,point.y-additional.y)
    }
    func taxi(to other:Point) -> Int {
        return abs(x-other.x) + abs(y-other.y)
    }
}

struct Area :Sequence {
    let start :Point
    let width :Int
    let height :Int
    init(at:Point, w:Int, h:Int) {
        start = at
        width = w
        height = h
    }
    init(asBoundingBoxOf points:[Point]) {
        var min = (x:points.first!.x, y:points.first!.y)
        var max = min
        for p in points {
            if p.x < min.x { min.x = p.x }
            if p.x > max.x { max.x = p.x }
            if p.y < min.y { min.y = p.y }
            if p.y > max.y { max.y = p.y }
        }
        start = Point(min.x,min.y)
        width = max.x - min.x + 1
        height = max.y - min.y + 1
    }
    
    func outset(by: Int) -> Area {
        return Area(at: start - (by,by), w: width + 2*by, h: height + 2*by)
    }
    
    func contains(point:Point) -> Bool {
        return start.x <= point.x && point.x < start.x + width &&
               start.y <= point.y && point.y < start.y + height
    }
    
    func makeIterator() -> Area.Iterator {
        return Area.Iterator(self)
    }
    struct Iterator :IteratorProtocol{
        let area: Area
        var times = 0
        init(_ area: Area) {
            self.area = area
        }
        mutating func next() -> Point? {
            let yOffset = times / area.width
            guard yOffset < area.height
                else { return nil }
            let xOffset = times % area.width
            times += 1
            return area.start + (xOffset,yOffset)
        }
    }
}

class InfiniteGrid<T:Equatable> {
    var grid = [Point: T]()
    let defaultValue :T
    
    init(defaultValue:T) {
        self.defaultValue = defaultValue
    }
    
    subscript (p: Point) -> T {
        get {
            if let thing = grid[p] {
                return thing
            }
            return defaultValue
        }
        set {
            grid[p] = newValue
        }
    }
    
    func forEach(_ body: (Point, T) throws -> Void ) rethrows {
        for (point, value) in grid {
            try body(point,value)
        }
    }
}

class Graph<T> where T:Hashable, T:Comparable {
    class Node {
        let value :T
        var completed = false
        var inputs = [Node]()
        var outputs = [Node]()
        init(value: T) { self.value = value }
    }
    
    var nodes = [T:Node]()
    
    func addNode(_ val:T) -> Node {
        let newNode = Node(value: val)
        nodes[val] = newNode
        return newNode
    }
    
    func addEdge(from:T, to:T){
        let fromNode = nodes[from] ?? addNode(from)
        let toNode = nodes[to] ?? addNode(to)
        fromNode.outputs.append(toNode)
        toNode.inputs.append(fromNode)
    }
    
    func entryNodes() -> [Node] {
        return nodes.values.filter { $0.inputs.isEmpty }
    }
}
