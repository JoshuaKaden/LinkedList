//
//  LinkedList.swift
//  LinkedList
//
//  Created by Kaden, Joshua on 2/9/18.
//  Copyright © 2018 NYC DoITT. All rights reserved.
//

import Foundation

public struct LinkedList<T: Equatable> {
    var start: LinkedListNode<T>? { return storage.start }
    var end: LinkedListNode<T>? { return storage.end }

    private var storage: LinkedListStorage<T>
    private var mutableStorage: LinkedListStorage<T> {
        mutating get {
            // Only copy if there are multiple references (Copy on Write)
            if !isKnownUniquelyReferenced(&storage) {
                storage = storage.copy()
            }
            return storage
        }
    }
    
    public init() {
        storage = LinkedListStorage()
    }
    
    public init<S: Sequence>(sequence elements: S) where S.Iterator.Element == T {
        storage = LinkedListStorage(sequence: elements)
    }
    
    public var count: Int {
        return storage.count
    }
    
    public mutating func append(_ value: T) {
        mutableStorage.append(value)
    }
    
    public func nodeAt(index: Int) -> LinkedListNode<T>? {
        return storage.nodeAt(index: index)
    }
    
    public mutating func remove(node: LinkedListNode<T>) {
        mutableStorage.remove(node: node)
    }
    
    public mutating func remove(index: Int) {
        mutableStorage.remove(index: index)
    }
}

// MARK: - Sequence

extension LinkedList: Sequence {
    public func makeIterator() -> LinkedListIterator<T> {
        return storage.makeIterator()
    }
}
