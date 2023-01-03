//
//  Heap.swift
//  Algorithms
//
//  Created by Mohit Kumar on 03/01/23.
//

import Foundation

final class Heap {
    
    // MARK: - Properties
    private var elements = [Int]()
    private var size: Int {
        return elements.count
    }
    
    // MARK: - Public methods
    func buildHeap(elements: [Int]) {
        let size = elements.count
        for index in stride(from: size/2, through: 0, by: -1) {
            maxHeapify(index: index)
        }
    }
    func insert(value: Int) {
        
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
        
        if left < size && elements[left] > elements[index] {
            largest = left
        } else if right < size && elements[right] > elements[largest] {
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
