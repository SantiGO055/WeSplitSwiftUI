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
    @State private var tapCount = 0 //Apple recomienda ponerla privada
    
    var body: some View {
        NavigationStack {
                Form {
                    Section {
                        Text("Hello, world!")
                        
                    }
                    Button("Tap Count: \(tapCount)") {
                           tapCount += 1
                       }
                }.navigationTitle("SwiftUI")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
