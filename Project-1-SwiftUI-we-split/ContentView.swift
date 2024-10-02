//
//  ContentView.swift
//  Project-1-SwiftUI-we-split
//
//  Created by Kevin Cuadros on 18/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 10
    
    @FocusState var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    let currencyFormat = Locale.current.currency?.identifier ?? "USD"
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
    
        return amountPerPerson
    }
    
    var total: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        return grandTotal
    }

    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("Local Currency: \(currencyFormat)")
                    TextField("Amount", value: $checkAmount, format: .currency(code: currencyFormat))
                        .keyboardType(.numberPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100, id: \.self){
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("Tip percentage"){
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101, id: \.self){
                            Text($0, format: .percent)
                        }
//                        ForEach(tipPercentages, id: \.self){
//                            Text($0, format: .percent)
//                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                
                Section("Amount per person"){
                    Text(totalPerPerson, format: .currency(code: currencyFormat))
                }
                
                Section("Total"){
                    Text(total, format: .currency(code: currencyFormat))
                        .foregroundStyle(
                            tipPercentage == 0 ? .red : .primary
                        )
                }

            }
            .navigationTitle("WeSplit")
            .toolbar{
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
            .toolbarRole(.editor)
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    ContentView()
}



//struct ContentView: View {
//    
//    @State private var tapCount = 0
//    @State private var name = ""
//    
//    let students = ["Harry", "Hermione", "Ron"]
//    @State private var selectedStudent = "Harry"
//    
//    var body: some View {
//        NavigationStack {
//            Form {
//                Section("Personal Info", content: {
//                    Text("Form")
//                })
//                Section("Form"){
//                    Text("Hello")
//                }
//                Text("Hello \(name)")
//                TextField("Enter your name", text: $name)
//                Button("Tap Count: \(tapCount)", action: {
//                    self.tapCount += 1
//                })
//                
//                Picker("Select your student", selection: $selectedStudent){
//                    ForEach(students, id: \.self) {
//                        Text($0)
//                    }
//                }
//                
//                Section {
//                    ForEach(0..<5) { number in
//                        Text("Row: \(number)")
//                    }
//                }
//                
//                ForEach(0..<5) {
//                    Text("Row: \($0)")
//                }
//                
//            }
//            .navigationTitle("Project 1")
//            .navigationBarTitleDisplayMode(.large)
//        }
//    }
//}
