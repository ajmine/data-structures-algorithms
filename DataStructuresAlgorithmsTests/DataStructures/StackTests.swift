//
//  StackTests.swift
//  DataStructuresAlgorithms
//
//  Created by Ali Ajmine on 11/5/16.
//  Copyright © 2016 Ali Ajmine. All rights reserved.
//

import Foundation

import XCTest
@testable import DataStructuresAlgorithms

class StackTests: XCTestCase {

    var stack: Stack!
    
    override func setUp() {
        super.setUp()
        
        stack = Stack()
    }
    
    override func tearDown() {
        stack = nil
        
        super.tearDown()
    }

    func testStack() {
        stack.push(Node(5))
        stack.push(Node(8))
        stack.push(Node(3))
        stack.push(Node(1))
        
        XCTAssertEqual(stack.stringValue(), "1-3-8-5")
        
        XCTAssertEqual(stack.pop()?.stringValue(), "1", "Pop 1")
        XCTAssertEqual(stack.pop()?.stringValue(), "3", "Pop 3")
        
        XCTAssertEqual(stack.stringValue(), "8-5")
        
        XCTAssertEqual(stack.pop()?.stringValue(), "8", "Pop 8")
        XCTAssertEqual(stack.pop()?.stringValue(), "5", "Pop 5")
        
        XCTAssertEqual(stack.stringValue(), "")
        
        XCTAssertNil(stack.pop()?.stringValue(), "Pop from empty stack")
    }
}
