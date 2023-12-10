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
    
    @State private var tapCount = 0 //Apple recomienda ponerla privada
    @State private var name = ""
    let students = ["Harry","Hermione","Ron"]
    @State private var selectedStudent = "Harry"
    var body: some View {
        
        NavigationStack {
                Form {
                    Section {
                        TextField("Enter your name here", text: $name) // the $name is for two ways binding, show it and write variable
                        
                        Text("Your name is \(name)")
                        
                    }
                    Button("Tap Count: \(tapCount)") {
                           tapCount += 1
                       }
                    Picker("Select your student",selection: $selectedStudent){
                        ForEach(students, id: \.self){ // Significa el id es el mismo string. Este id es para identificar en la lista un unico valor por si llega a cambiar
                            Text($0)
                        }
                    }
                }.navigationTitle("SwiftUI")
                .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

#Preview {
    ContentView()
}
