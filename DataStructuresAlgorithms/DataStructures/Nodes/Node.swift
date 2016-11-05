//
//  Node.swift
//  AlgorithmsDataStructures
//
//  Created by Ali Ajmine on 11/4/16.
//  Copyright © 2016 Ali Ajmine. All rights reserved.
//

import Foundation

class Node: Equatable {
    var next: Node? = nil
    let data: Int
    
    init(_ data: Int) {
        self.data = data
    }
    
    func stringValue() -> String {
        return "\(data)"
    }
}

func ==(lhs: Node, rhs: Node) -> Bool {
    return lhs.data == rhs.data
}
