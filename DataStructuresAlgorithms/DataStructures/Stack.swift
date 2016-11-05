//
//  Stack.swift
//  DataStructuresAlgorithms
//
//  Created by Ali Ajmine on 10/18/16.
//  Copyright © 2016 Ali Ajmine. All rights reserved.
//

import Foundation

class Stack {
    
    private var top: Node? = nil
    
    func push(_ node: Node) {
        // Set top to node if stack is empty
        guard !isEmpty() else {
            top = node
            return
        }
        
        // Set top to node
        node.next = top
        top = node
    }
    
    func pop() -> Node? {
        // Return nil if stack is empty
        guard !isEmpty() else { return nil }
        
        // Set top to top's next and return top
        let tmp = top
        top = top?.next
        return tmp
    }
    
    private func isEmpty() -> Bool {
        return top == nil
    }
    
    // Left-most node is top
    func stringValue() -> String {
        // Return empty string if list is empty
        guard !isEmpty() else { return "" }
        
        // Iterate through list and build string
        var tmp = top
        var stack = ""
        
        while tmp != nil {
            if let node = tmp?.stringValue() {
                stack += tmp == top ? node : "-\(node)"
            }
            
            tmp = tmp?.next
        }
        
        return stack
    }
}
