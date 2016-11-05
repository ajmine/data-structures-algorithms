//
//  QueueTests.swift
//  DataStructuresAlgorithms
//
//  Created by Ali Ajmine on 11/5/16.
//  Copyright © 2016 Ali Ajmine. All rights reserved.
//

import Foundation

import XCTest
@testable import DataStructuresAlgorithms

class QueueTests: XCTestCase {

    var queue: Queue!
    
    override func setUp() {
        super.setUp()
        
        queue = Queue()
    }
    
    override func tearDown() {
        queue = nil
        
        super.tearDown()
    }
    
    func testQueue() {
        
        queue.enqueue(Node(5))
        queue.enqueue(Node(8))
        queue.enqueue(Node(3))
        queue.enqueue(Node(1))
        
        XCTAssertEqual(queue.stringValue(), "5-8-3-1")
        
        XCTAssertEqual(queue.dequeue()?.stringValue(), "5", "Dequeue 5")
        XCTAssertEqual(queue.dequeue()?.stringValue(), "8", "Dequeue 8")
        
        XCTAssertEqual(queue.stringValue(), "3-1")
        
        XCTAssertEqual(queue.dequeue()?.stringValue(), "3", "Dequeue 3")
        XCTAssertEqual(queue.dequeue()?.stringValue(), "1", "Dequeue 1")
        
        XCTAssertEqual(queue.stringValue(), "")
        
        XCTAssertNil(queue.dequeue()?.stringValue(), "Dequeue from empty queue")
    }
}
