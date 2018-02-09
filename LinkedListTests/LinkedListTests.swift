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
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
