//
//  SinglyLinkedList.swift
//  DataStructuresAlgorithms
//
//  Created by Ali Ajmine on 11/4/16.
//  Copyright © 2016 Ali Ajmine. All rights reserved.
//

import Foundation

class SinglyLinkedList {
    
    fileprivate var head: Node? = nil
    
    func insert(_ node: Node) {
        // Set node to head and early return
        guard !isEmpty() else {
            head = node
            return
        }
        
        // Find last node in the list
        var tmp = head
        
        while tmp?.next != nil {
            tmp = tmp?.next
        }
        
        // Add node
        tmp?.next = node
    }
    
    func insertNodeAtIndex(_ node: Node, index: Int) -> Bool {
        // Early return if index is less than 0
        guard index >= 0 else { return false }
        
        var prev: Node?
        var curr = head
        
        // Iterate through list and find where to insert node
        for _ in (0..<index) {
            guard curr != nil || prev != nil else { return false }
            
            prev = curr
            curr = curr?.next
        }
        
        // Insert node
        if head == curr {
            node.next = curr
            head = node
        }
        else {
            node.next = curr
            prev?.next = node
        }
        
        return true
    }
    
    func delete(_ node: Node) {
        // Early return if list is empty
        guard !isEmpty() else { return }
        
        // Set head to next node or set head to nil if no next node
        if head == node {
            head = head?.next ?? nil
        }
        // Iterate through list and delete node if found
        else {
            var prev: Node?
            var curr = head
            
            while curr != nil {
                if curr == node {
                    prev?.next = curr?.next
                    curr?.next = nil
                    return
                }
                
                prev = curr
                curr = curr?.next
            }
        }
    }
    
    func search(_ node: Node) -> Bool {
        // Early return if list is empty
        guard !isEmpty() else { return false }
        
        // Iterate through list and return true if node found
        var tmp = head
        
        while tmp != nil {
            if tmp == node {
                return true
            }
            
            tmp = tmp?.next
        }
        
        return false
    }
    
    private func isEmpty() -> Bool {
        return head == nil
    }
    
    // Left-most node is head
    func stringValue() -> String {
        // Return empty string if list is empty
        guard !isEmpty() else { return "" }
        
        // Iterate through list and build string
        var tmp = head
        var list = ""
        
        while tmp != nil {
            if let node = tmp?.stringValue() {
                list += tmp == head ? node : "-\(node)"
            }
            
            tmp = tmp?.next
        }
        
        return list
    }
    
}

extension SinglyLinkedList {
    
    func removeDuplicates() {
        var data = Set<Int>()
        var tmp = head

        while tmp != nil {
            guard let temp = tmp else { continue }

            if data.contains(temp.data) {
                delete(temp)
            }
            else {
                data.insert(temp.data)
            }

            tmp = tmp?.next
        }
    }
    
    func containsDuplicates() -> Bool {
        var data = Set<Int>()
        var tmp = head
        
        while tmp != nil {
            guard let temp = tmp else { continue }
            
            if data.contains(temp.data) {
                return true
            }
            else {
                data.insert(temp.data)
            }
            
            tmp = tmp?.next
        }
        
        return false
    }
}
