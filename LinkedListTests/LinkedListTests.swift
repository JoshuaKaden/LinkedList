//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by Kaden, Joshua on 2/9/18.
//  Copyright © 2018 NYC DoITT. All rights reserved.
//

import XCTest
@testable import LinkedList

class LinkedListTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitWithSequence() {
        let strings = ["Alpha", "Beta", "Gamma", "Delta"]
        let list = LinkedList(sequence: strings)
        for index in 0...list.count - 1 {
            let node = list.nodeAt(index: index)
            XCTAssertNotNil(node)
            XCTAssertEqual(node?.value, strings[index])
        }
    }
    
    func testAppend() {
        let strings = ["Alpha", "Beta", "Gamma", "Delta"]
        var list = LinkedList<String>()
        strings.forEach { list.append($0) }
        for index in 0...list.count - 1 {
            let node = list.nodeAt(index: index)
            XCTAssertNotNil(node)
            XCTAssertEqual(node?.value, strings[index])
        }
    }
    
    func testCount() {
        let strings = ["Alpha", "Beta", "Gamma", "Delta"]
        var list = LinkedList<String>()
        XCTAssertEqual(list.count, 0)
        
        list.append(strings[0])
        XCTAssertEqual(list.count, 1)
        list.append(strings[1])
        XCTAssertEqual(list.count, 2)
        list.append(strings[2])
        XCTAssertEqual(list.count, 3)
        
        list.remove(index: 2)
        XCTAssertEqual(list.count, 2)
    }
    
    func testNodewalk() {
        let strings = ["Alpha", "Beta", "Gamma", "Delta"]
        let list = LinkedList(sequence: strings)
        
        let node1 = list.start
        XCTAssertNotNil(node1)
        XCTAssertNil(node1?.previous)
        
        let node2 = node1?.next
        XCTAssertNotNil(node2)
        XCTAssertEqual(node2?.previous?.value, node1?.value)
        
        let node3 = node2?.next
        XCTAssertNotNil(node3)
        XCTAssertEqual(node3?.previous?.value, node2?.value)

        let node4 = node3?.next
        XCTAssertNotNil(node4)
        XCTAssertEqual(node4?.previous?.value, node3?.value)
        
        XCTAssertNil(node4?.next)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
