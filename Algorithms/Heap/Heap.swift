//
//  Heap.swift
//  Algorithms
//
//  Created by Mohit Kumar on 03/01/23.
//

import Foundation

protocol Heap {
    associatedtype Element
    
    var elements: [Element] { get set }
    var size: Int { get }
    
    func buildHeap(elements: [Element])
    func printHeap()
    
    func swap(fromIndex: Int, toIndex: Int)
}

final class MaxHeap<Element: Comparable> {
    
    // MARK: - Properties
    private var elements = [Element]()
    private var size: Int {
        return elements.count
    }
    
    // MARK: - Public methods
    func buildHeap(elements: [Element]) {
        self.elements = elements
        for index in stride(from: size/2, through: 0, by: -1) {
            maxHeapify(index: index)
        }
    }
    /// O(logn) - Operation perform maxHeapify
    private func delete(at index: Int) {
        guard !elements.isEmpty, elements.indices.contains(index) else { return }
        
        self.elements[index] = self.elements[size-1]
        self.elements.removeLast()
        
        self.maxHeapify(index: index)
    }
    /// O(n) - Finding index of the item in the list
    func delete(value: Element) {
        if let index = self.elements.firstIndex(of: value) {
            delete(at: index)
        }
    }
    func insert(value: Element) {
        self.elements.append(value)
        
        heapifyUp(index: size-1)
    }
    private func heapifyUp(index: Int) {
        if index == 0 {
            // We are alreadyx at top of the heap
            return
        }
        
        let parent = parent(of: index)
        if elements[index] > elements[parent] {
            swap(fromIndex: parent, toIndex: index)
            heapifyUp(index: parent)
        }
    }
    
    func printHeap() {
        for item in elements {
            print(item, terminator: " ")
        }
    }
    
    // MARK: - Private helper methods
    private func left(of index: Int) -> Int {
        return (2*index)+1
    }
    private func right(of index: Int) -> Int {
        return (2*index)+2
    }
    private func parent(of index: Int) -> Int {
        return (index-1)/2
    }
    private func maxHeapify(index: Int) {
        let left = left(of: index)
        let right = right(of: index)
        var largest = index
        
        if left < size && elements[left] >= elements[index] {
            largest = left
        }
        
        if right < size && elements[right] > elements[largest] {
            largest = right
        }
        
        if largest != index {
            swap(fromIndex: largest, toIndex: index)
            maxHeapify(index: largest)
        }
    }
    private func swap(fromIndex: Int, toIndex: Int) {
        let tempValue = elements[fromIndex]
        elements[fromIndex] = elements[toIndex]
        elements[toIndex] = tempValue
    }
}

final class MinHeap<Element: Comparable> {
    
    /// MARK: - Properties
    private var elements = [Element]()
    private var size: Int {
        return elements.count
    }
    
    /// MARK: - Public methods
    func buildHeap(elements: [Element]) {
        self.elements = elements
        for index in stride(from: size/2, through: 0, by: -1) {
            minHeapify(index: index)
        }
    }
    private func delete(at index: Int) {
        guard !elements.isEmpty, elements.indices.contains(index) else { return }
        
        self.elements[index] = self.elements[size-1]
        self.elements.removeLast()
        
        self.minHeapify(index: index)
    }
    func delete(value: Element) {
        if let index = self.elements.firstIndex(of: value) {
            delete(at: index)
        }
    }
    func insert(value: Element) {
        self.elements.append(value)
        
        heapifyUp(index: size-1)
    }
    func printHeap() {
        for item in elements {
            print(item, terminator: " ")
        }
    }
    
    /// MARK: - Private helper methods
    private func heapifyUp(index: Int) {
        if index == 0 {
            // We are alreadyx at top of the heap
            return
        }
        
        let parent = parent(of: index)
        if elements[index] < elements[parent] {
            swap(fromIndex: parent, toIndex: index)
            heapifyUp(index: parent)
        }
    }
    private func minHeapify(index: Int) {
        let left = left(of: index)
        let right = right(of: index)
        var smallest = index
        
        if left < size && elements[left] <= elements[index] {
            smallest = left
        }
        
        if right < size && elements[right] < elements[smallest] {
            smallest = right
        }
        
        if smallest != index {
            swap(fromIndex: smallest, toIndex: index)
            minHeapify(index: smallest)
        }
    }


    private func left(of index: Int) -> Int {
        return (2*index)+1
    }
    private func right(of index: Int) -> Int {
        return (2*index)+2
    }
    private func parent(of index: Int) -> Int {
        return (index-1)/2
    }


    private func swap(fromIndex: Int, toIndex: Int) {
        let tempValue = elements[fromIndex]
        elements[fromIndex] = elements[toIndex]
        elements[toIndex] = tempValue
    }
}
