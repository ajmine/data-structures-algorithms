//
//  BinaryTreeNode.swift
//  AlgorithmsDataStructures
//
//  Created by Ali Ajmine on 11/4/16.
//  Copyright © 2016 Ali Ajmine. All rights reserved.
//

import Foundation

class BinaryTreeNode {
    
    var left: BinaryTreeNode? = nil
    var right: BinaryTreeNode? = nil
    
    let data: Int
    
    init(data: Int) {
        self.data = data
    }
    
    func insert(_ data: Int) {
        
        if data <= self.data {
            
            if left == nil {
                left = BinaryTreeNode(data: data)
            }
            else {
                left?.insert(data)
            }
        }
        else if data > self.data {
            
            if right == nil {
                right = BinaryTreeNode(data: data)
            }
            else {
                right?.insert(data)
            }
        }
    }
    
}
