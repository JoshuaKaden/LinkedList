//
//  LinkedListNode.swift
//  LinkedList
//
//  Created by Kaden, Joshua on 2/9/18.
//  Copyright © 2018 NYC DoITT. All rights reserved.
//

import Foundation

public final class LinkedListNode<T: Equatable> {
    let value: T
    
    var next: LinkedListNode<T>? = nil
    var previous: LinkedListNode<T>? = nil
    
    init(value: T) {
        self.value = value
    }
}

extension LinkedListNode: CustomStringConvertible {
    public var description: String {
        return "LinkedListNode(\(value))"
    }
}
