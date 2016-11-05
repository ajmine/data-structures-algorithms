//
//  SinglyLinkedListTests.swift
//  AlgorithmsDataStructures
//
//  Created by Ali Ajmine on 11/4/16.
//  Copyright © 2016 Ali Ajmine. All rights reserved.
//

import XCTest
@testable import DataStructuresAlgorithms

class SinglyLinkedListTests: XCTestCase {
    
    var linkedList: SinglyLinkedList!
    
    override func setUp() {
        super.setUp()
        
        linkedList = SinglyLinkedList()
    }
    
    override func tearDown() {
        linkedList = nil
        
        super.tearDown()
    }
    
    func testEmptyList() {
        XCTAssertEqual(linkedList.stringValue(), "")
    }
    
    func testInsert() {
        linkedList.insert(Node(5))
        
        XCTAssertEqual(linkedList.stringValue(), "5")
        
        linkedList.insert(Node(8))
        linkedList.insert(Node(3))
        
        XCTAssertEqual(linkedList.stringValue(), "5-8-3")
    }
    
    func testInsertAtIndex() {
        linkedList.insert(Node(5))
        linkedList.insert(Node(8))
        linkedList.insert(Node(3))
        
        XCTAssertEqual(linkedList.stringValue(), "5-8-3")
        
        XCTAssertTrue(linkedList.insertNodeAtIndex(Node(9), index: 0), "Insert in the beginning")
        XCTAssertEqual(linkedList.stringValue(), "9-5-8-3")
        
        XCTAssertTrue(linkedList.insertNodeAtIndex(Node(1), index: 4), "Insert at the end")
        XCTAssertEqual(linkedList.stringValue(), "9-5-8-3-1")
        
        XCTAssertTrue(linkedList.insertNodeAtIndex(Node(2), index: 3), "Insert in the middle")
        XCTAssertEqual(linkedList.stringValue(), "9-5-8-2-3-1")
        
        XCTAssertFalse(linkedList.insertNodeAtIndex(Node(7), index: 10), "Insert out of bounds")
        XCTAssertEqual(linkedList.stringValue(), "9-5-8-2-3-1")
    }
    
    func testDelete() {
        linkedList.insert(Node(5))
        linkedList.insert(Node(8))
        linkedList.insert(Node(3))
        
        XCTAssertEqual(linkedList.stringValue(), "5-8-3")
        
        linkedList.delete(Node(8))
        XCTAssertEqual(linkedList.stringValue(), "5-3", "Delete middle")
        
        linkedList.delete(Node(5))
        XCTAssertEqual(linkedList.stringValue(), "3", "Delete first")
        
        linkedList.delete(Node(3))
        XCTAssertEqual(linkedList.stringValue(), "", "Delete first/last")
    }
    
    func testSearch() {
        linkedList.insert(Node(5))
        linkedList.insert(Node(8))
        linkedList.insert(Node(3))
        
        XCTAssertTrue(linkedList.search(Node(5)))
        XCTAssertTrue(linkedList.search(Node(8)))
        XCTAssertTrue(linkedList.search(Node(3)))
        
        linkedList.delete(Node(8))
        XCTAssertFalse(linkedList.search(Node(8)))
    }
    
    func testDuplicates() {
        linkedList.insert(Node(5))
        linkedList.insert(Node(8))
        linkedList.insert(Node(3))
        linkedList.insert(Node(7))
        
        XCTAssertFalse(linkedList.containsDuplicates())
        
        linkedList.insert(Node(8))
        linkedList.insert(Node(7))
        linkedList.insert(Node(3))
        
        XCTAssertTrue(linkedList.containsDuplicates())
        
        linkedList.removeDuplicates()
        
        XCTAssertFalse(linkedList.containsDuplicates())
    }
}
