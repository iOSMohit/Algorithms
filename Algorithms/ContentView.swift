//
//  ContentView.swift
//  Algorithms
//
//  Created by Mohit Kumar on 03/01/23.
//

import SwiftUI

struct ContentView: View {
    private let heap = Heap()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
