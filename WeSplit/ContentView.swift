//
//  ContentView.swift
//  WeSplit
//
//  Created by Santiago Gonzalez on 29/11/2023.
//
//en este archivo haremos todo el trabajo de este proyecto
import SwiftUI

struct ContentView: View {
    // var tapCount = 0 si hago esto no puedo por que el struct es inmutable
    // tengo que declararlo como mutable pero no puedo con la vista. Se usa esto:
    
    // So, when you see a dollar sign before a property name, remember that it creates a two-way binding: the value of the property is read, but also written
    
    var body: some View {
        Text("Hello, world!")
    }
}

#Preview {
    ContentView()
}
