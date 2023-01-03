//
//  ContentView.swift
//  Algorithms
//
//  Created by Mohit Kumar on 03/01/23.
//

import SwiftUI

struct ContentView: View {
    private let heap = MaxHeap<Int>()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            heap.buildHeap(elements: [16, 8, 18, 22, 41, 6, 16, 53, 60, 32, 86, 93, 75])
            heap.printHeap()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
