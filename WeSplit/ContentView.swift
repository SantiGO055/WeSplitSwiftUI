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
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool //foco para esconder el teclado
    
    let tipPercentages = [10, 15, 20, 25, 0]
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    var totalAmount: Double {
        let tipValue = checkAmount / 100 * Double(tipPercentage)
        let total = checkAmount + tipValue
        return total
    }
    
    var body: some View {
        NavigationStack{
            
        
            Text("Hello, world!")
            
            /*
             Locale is a massive struct built into iOS that is responsible for storing all the user’s region settings – what calendar they use, how they separate thousands digits in numbers, whether they use the metric system, and more. In our case, we’re asking whether the user has a preferred currency code, and if they don’t we’ll fall back to “USD” so at least we have something
             */
            
            Form {
                Section("Amount") {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.numberPad)
                        .focused($amountIsFocused)
                }
                Picker("Number of people", selection: $numberOfPeople) {
                    ForEach(2..<100) {
                        Text("\($0) people")
                    }
                }
                .pickerStyle(.navigationLink)
                .navigationTitle("WeSplit")
                .toolbar {
                    if amountIsFocused {
                        Button("Done") {
                            amountIsFocused = false
                        }
                    }
                }
                
                Section("How much tip do you want to leave?"){
                    Picker("Tip percentage",selection: $tipPercentage){
                        ForEach(0..<101){
                            Text($0,format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Section("Amount per person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                Section("Total amount") {
                    Text(totalAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
            }
        }
                
        
    }
}

#Preview {
    ContentView()
}
