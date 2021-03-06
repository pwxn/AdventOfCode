//
//  AocTest.swift
//  AocTest
//
//  Created by Paul Landers on 11/13/18.
//

import XCTest

class AocTest: XCTestCase {
    struct Case { var input:String; var p1:String?; var p2:String?}
    var examples :[Case] { return []}
    var problem :Problem { return day1 }
    func testAll() {
        for ex in examples {
            let sol = problem(ex.input)
            if let p1 = ex.p1, p1.count > 0 {
                XCTAssertEqual(sol.partOne, p1)
            }
            if let p2 = ex.p2, p2.count > 0 {
                XCTAssertEqual(sol.partTwo, p2)
            }
        }
    }
}

// Case(input:"", p1:"", p2:""),
// Case(input:"""
// """, p1:"", p2:""),

class Day1Tests: AocTest { override var problem:Problem{return day1}; override var examples :[Case] { return [
    Case(input:"""
12
14
1969
""", p1:"658", p2:"970"),
    ]}}
//class Day2Tests: AocTest { override var problem:Problem{return day2}; override var examples :[Case] { return []}}
class Day3Tests: AocTest { override var problem:Problem{return day3}; override var examples :[Case] { return [
    Case(input:"""
    R8,U5,L5,D3
    U7,R6,D4,L4
    """, p1:"6", p2:"30"),
    Case(input:"""
    R75,D30,R83,U83,L12,D49,R71,U7,L72
    U62,R66,U55,R34,D71,R55,D58,R83
    """, p1:"159", p2:"610"),
    Case(input:"""
    R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51
    U98,R91,D20,R16,D67,R40,U7,R15,U6,R7
    """, p1:"135", p2:"410"),
    ]}}
//class Day4Tests: AocTest { override var problem:Problem{return day4}; override var examples :[Case] { return [
//    ]}}
//class Day5Tests: AocTest { override var problem:Problem{return day5}; override var examples :[Case] { return [
//    ]}}
class Day6Tests: AocTest { override var problem:Problem{return day6}; override var examples :[Case] { return [
    Case(input:"""
    B)YOU
    YOU)D
    D)E
    COM)B
    E)F
    G)SAN
    D)I
    B)G
    E)J
    J)K
    K)L
    """, p1:"42", p2:""),
    Case(input:"""
    COM)B
    B)C
    C)D
    D)E
    E)F
    B)G
    G)H
    D)I
    E)J
    J)K
    K)L
    K)YOU
    I)SAN
    """, p1:"", p2:"4"),
    ]}}

class Day7Tests: AocTest { override var problem:Problem{return day7}; override var examples :[Case] { return [
    Case(input:"""
    3,23,3,24,1002,24,10,24,1002,23,-1,23,101,5,23,23,1,24,23,23,4,23,99,0,0
    """, p1:"54321", p2:""),
    Case(input:"""
    3,15,3,16,1002,16,10,16,1,16,15,15,4,15,99,0,0
    """, p1:"43210", p2:""),
    Case(input:"""
    3,26,1001,26,-4,26,3,27,1002,27,2,27,1,27,26,27,4,27,1001,28,-1,28,1005,28,6,99,0,0,5
    """, p1:"", p2:"139629729"),
    ]}}
//class Day8Tests: AocTest { override var problem:Problem{return day8}; override var examples :[Case] { return [
//    ]}}
//class Day9Tests: AocTest { override var problem:Problem{return day9}; override var examples :[Case] { return [
//    ]}}
class Day10Tests: AocTest { override var problem:Problem{return day10}; override var examples :[Case] { return [
    Case(input:"""
    .#..#
    .....
    #####
    ....#
    ...##
    """, p1:"8", p2:""),
    Case(input:"""
    ......#.#.
    #..#.#....
    ..#######.
    .#.#.###..
    .#..#.....
    ..#....#.#
    #..#....#.
    .##.#..###
    ##...#..#.
    .#....####
    """, p1:"33", p2:""),
    Case(input:"""
    .#..##.###...#######
    ##.############..##.
    .#.######.########.#
    .###.#######.####.#.
    #####.##.#.##.###.##
    ..#####..#.#########
    ####################
    #.####....###.#.#.##
    ##.#################
    #####.##.###..####..
    ..######..##.#######
    ####.##.####...##..#
    .#####..#.######.###
    ##...#.##########...
    #.##########.#######
    .####.#.###.###.#.##
    ....##.##.###..#####
    .#.#.###########.###
    #.#.#.#####.####.###
    ###.##.####.##.#..##
    """, p1:"210", p2:"802"),
    ]}}
//class Day11Tests: AocTest { override var problem:Problem{return day11}; override var examples :[Case] { return [
//    ]}}
class Day12Tests: AocTest { override var problem:Problem{return day12}; override var examples :[Case] { return [
    Case(input:"""
    <x=-1, y=0, z=2>
    <x=2, y=-10, z=-7>
    <x=4, y=-8, z=8>
    <x=3, y=5, z=-1>
    """, p1:"1940", p2:""),
    Case(input:"""
    <x=-8, y=-10, z=0>
    <x=5, y=5, z=10>
    <x=2, y=-7, z=3>
    <x=9, y=-8, z=-3>
    """, p1:"1940", p2:""),
    ]}}
//class Day13Tests: AocTest { override var problem:Problem{return day13}; override var examples :[Case] { return [
//    ]}}
class Day14Tests: AocTest { override var problem:Problem{return day14}; override var examples :[Case] { return [
     Case(input:"""
     157 ORE => 5 NZVS
     165 ORE => 6 DCFZ
     44 XJWVT, 5 KHKGT, 1 QDVJ, 29 NZVS, 9 GPVTF, 48 HKGWZ => 1 FUEL
     12 HKGWZ, 1 GPVTF, 8 PSHF => 9 QDVJ
     179 ORE => 7 PSHF
     177 ORE => 5 HKGWZ
     7 DCFZ, 7 PSHF => 2 XJWVT
     165 ORE => 2 GPVTF
     3 DCFZ, 7 NZVS, 5 HKGWZ, 10 PSHF => 8 KHKGT
     """, p1:"13312", p2:"82892753"),
    ]}}
//class Day15Tests: AocTest { override var problem:Problem{return day15}; override var examples :[Case] { return [
//    ]}}
class Day16Tests: AocTest { override var problem:Problem{return day16}; override var examples :[Case] { return [
    Case(input:"80871224585914546619083218645595", p1:"24176176", p2:"84462026"),
    Case(input:"19617804207202209144916044189917", p1:"73745418", p2:""),
    Case(input:"69317163492948606335995924319873", p1:"52432133", p2:""),
    ]}}
//class Day17Tests: AocTest { override var problem:Problem{return day17}; override var examples :[Case] { return [
//    ]}}
class Day18Tests: AocTest { override var problem:Problem{return day18}; override var examples :[Case] { return [
    Case(input:"""
    ########################
    #...............b.C.D.f#
    #.######################
    #.....@.a.B.c.d.A.e.F.g#
    ########################
    """, p1:"132", p2:""),
    Case(input:"""
    #################
    #i.G..c...e..H.p#
    ########.########
    #j.A..b...f..D.o#
    ########@########
    #k.E..a...g..B.n#
    ########.########
    #l.F..d...h..C.m#
    #################
    """, p1:"136", p2:""),
    Case(input:"""
    ########################
    #@..............ac.GI.b#
    ###d#e#f################
    ###A#B#C################
    ###g#h#i################
    ########################
    """, p1:"81", p2:""),
    ]}}
//class Day19Tests: AocTest { override var problem:Problem{return day19}; override var examples :[Case] { return [
//    ]}}
class Day20Tests: AocTest { override var problem:Problem{return day20}; override var examples :[Case] { return [
    Case(input:"""
                   A   
                   A
  #################.#############
  #.#...#...................#.#.#
  #.#.#.###.###.###.#########.#.#
  #.#.#.......#...#.....#.#.#...#
  #.#########.###.#####.#.#.###.#
  #.............#.#.....#.......#
  ###.###########.###.#####.#.#.#
  #.....#        A   C    #.#.#.#
  #######        S   P    #####.#
  #.#...#                 #......VT
  #.#.#.#                 #.#####
  #...#.#               YN....#.#
  #.###.#                 #####.#
DI....#.#                 #.....#
  #####.#                 #.###.#
ZZ......#               QG....#..AS
  ###.###                 #######
JO..#.#.#                 #.....#
  #.#.#.#                 ###.#.#
  #...#..DI             BU....#..LF
  #####.#                 #.#####
YN......#               VT..#....QG
  #.###.#                 #.###.#
  #.#...#                 #.....#
  ###.###    J L     J    #.#.###
  #.....#    O F     P    #.#...#
  #.###.#####.#.#####.#####.###.#
  #...#.#.#...#.....#.....#.#...#
  #.#####.###.###.#.#.#########.#
  #...#.#.....#...#.#.#.#.....#.#
  #.###.#####.###.###.#.#.#######
  #.#.........#...#.............#
  #########.###.###.#############
           B   J   C
           U   P   P
""", p1:"58", p2:""),

    ]}}
class Day22Tests: AocTest {
    func testDeck() {
        var deck = Deck(size:10)
        deck.performOps(list: ["cut 6","deal with increment 7","deal into new stack"])
        XCTAssertEqual(deck.cards, [3,0,7,4,1,8,5,2,9,6])
    }
}
//class Day23Tests: AocTest { override var problem:Problem{return day23}; override var examples :[Case] { return [
//    ]}}
class Day24Tests: AocTest { override var problem:Problem{return day24}; override var examples :[Case] { return [
    Case(input:"""
    ....#
    #..#.
    #..##
    ..#..
    #....
    """, p1:"2129920", p2:""),
    ]}}
//class Day25Tests: AocTest { override var problem:Problem{return day25}; override var examples :[Case] { return [
//    ]}}

class IntcodeTest: XCTestCase {
    func testAddMult() {
        XCTAssertEqual(intcodeProg("1,9,10,3,2,3,11,0,99,30,40,50".integerArray(",")), 3500)
    }
    func testQuine() {
        let progInts = [109,1,204,-1,1001,100,1,100,1008,100,16,101,1006,101,0,99]
        let prog = Intcode(program: progInts)
        let _ = prog.run()
        XCTAssertEqual(progInts, prog.output)
    }
    func testBigNumbers() {
        let prog = Intcode(program: [104,1125899906842624,99])
        let _ = prog.run()
        XCTAssertEqual(prog.output.last!, 1125899906842624)
        
        let prog2 = Intcode(program: [1102,34915192,34915192,7,4,7,99,0])
        let _ = prog2.run()
        XCTAssertEqual(prog2.output.last!.digits().count, 16)
    }
}

class UtilsTest: XCTestCase {
    func testExtract() {
        XCTAssertEqual("#1 @ 1,3: 4x4".extract(format:"#% @ %,%: %x%"),
                       [1,1,3,4,4])
    }
    
    func testCharacter() {
        XCTAssertEqual(Character("A").asciiValue, 65)
        XCTAssertEqual(Character("a").asciiValue, 97)
        XCTAssertEqual(Character("A").lowerCase, "a")
        XCTAssertEqual(Character("A").lowerCase, Character("a").lowerCase)
        XCTAssertEqual(Character("b").lowerCase, "b")
        XCTAssertEqual(Character("X").lowerCase, Character("x"))
    }
    
    func testDigits() {
        XCTAssertEqual(123.digits(), [1,2,3])
        XCTAssertEqual(10.digits(), [1,0])
        XCTAssertEqual(6.digits(), [6])
        XCTAssertEqual(647832.digits(), [6,4,7,8,3,2])
    }
}

