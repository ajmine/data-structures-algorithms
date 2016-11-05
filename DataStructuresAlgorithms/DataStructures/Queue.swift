//
//  Queue.swift
//  DataStructuresAlgorithms
//
//  Created by Ali Ajmine on 10/18/16.
//  Copyright © 2016 Ali Ajmine. All rights reserved.
//

import Foundation

class Queue {
    
    private var first: Node? = nil
    private var last: Node? = nil
    
    func enqueue(_ node: Node) {
        // Set first and last to node if queue is empty and early return
        guard !isEmpty() else {
            first = node
            last = first
            return
        }
        
        // Set node to be last node
        last?.next = node
        last = node
    }
    
    func dequeue() -> Node? {
        // Early return if queue is empty
        guard !isEmpty() else { return nil }
        
        // Remove first node
        let tmp = first
        
        first = first?.next
        tmp?.next = nil
        
        return tmp
    }
    
    private func isEmpty() -> Bool {
        return first == nil
    }
    
    // Left-most node is first. Right-most is last
    func stringValue() -> String {
        // Return empty string if list is empty
        guard !isEmpty() else { return "" }
        
        // Iterate through list and build string
        var tmp = first
        var queue = ""
        
        while tmp != nil {
            if let node = tmp?.stringValue() {
                queue += tmp == first ? node : "-\(node)"
            }
            
            tmp = tmp?.next
        }
        
        return queue
    }
}
