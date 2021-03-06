//
//  LinkedListStorage.swift
//  LinkedList
//
//  Created by Kaden, Joshua on 2/9/18.
//  Copyright © 2018 NYC DoITT. All rights reserved.
//

import Foundation

final class LinkedListStorage<T: Equatable> {
    
    // MARK: - Private Properties
    
    private(set) var start: LinkedListNode<T>? {
        didSet {
            if end == nil {
                end = start
            }
        }
    }
    
    private(set) var end: LinkedListNode<T>? {
        didSet {
            if start == nil {
                start = end
            }
        }
    }
    
    private(set) var count: Int = 0
    
    // MARK: - Lifecycle
    
    init() {
        // no op
    }
    
    init<S: Sequence>(sequence elements: S) where S.Iterator.Element == T {
        elements.forEach { append($0) }
    }
    
    // MARK: - Public Methods
    
    func append(_ value: T) {
        let previousEnd = end
        end = LinkedListNode(value: value)
        
        end?.previous = previousEnd
        previousEnd?.next = end
        
        count += 1
    }
    
    func copy() -> LinkedListStorage<T> {
        let newList = LinkedListStorage<T>()
        
        for element in self {
            newList.append(element.value)
        }
        
        return newList
    }
    
    func nodeAt(index: Int) -> LinkedListNode<T>? {
        guard index >= 0, index < count else {
            return nil
        }
        
        var currentIndex = 0
        var currentNode = start
        while currentNode != nil {
            if currentIndex == index {
                return currentNode
            }
            currentIndex += 1
            currentNode = currentNode?.next
        }
        
        return nil
    }
    
    func remove(node nodeToRemove: LinkedListNode<T>) {
        let nextNode = nodeToRemove.next
        let previousNode = nodeToRemove.previous
        
        defer {
            count -= 1
        }
        
        if nodeToRemove === start && nodeToRemove === end {
            start = nil
            end = nil
            return
        }
        
        if nodeToRemove === start {
            start = nodeToRemove.next
            return
        }
        
        if nodeToRemove === end {
            end = nodeToRemove.previous
            return
        }
        
        previousNode?.next = nextNode
        nextNode?.previous = previousNode
    }
    
    func remove(index: Int) {
        guard let node = nodeAt(index: index) else { return }
        remove(node: node)
    }
}

// MARK: - LinkedListIterator

public struct LinkedListIterator<T: Equatable>: IteratorProtocol {
    public typealias Element = LinkedListNode<T>
    
    /// The current node in the iteration
    private var currentNode: Element?
    
    init(startNode: Element?) {
        currentNode = startNode
    }
    
    mutating public func next() -> LinkedListIterator.Element? {
        let node = currentNode
        currentNode = currentNode?.next
        return node
    }
}

// MARK: - Sequence

extension LinkedListStorage: Sequence {
    public typealias Iterator = LinkedListIterator<T>
    
    public func makeIterator() -> LinkedListStorage.Iterator {
        return LinkedListIterator(startNode: start)
    }
}
