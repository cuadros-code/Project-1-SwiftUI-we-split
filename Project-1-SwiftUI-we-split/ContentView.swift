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
    @State private var tipPercentage = 20
    
    @FocusState var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    let currencyFormat = Locale.current.currency?.identifier ?? "USD"
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        print(checkAmount / 100)
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
    
        return amountPerPerson
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
                        ForEach(tipPercentages, id: \.self){
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                
                Section("Resume"){
                    Text(totalPerPerson, format: .currency(code: currencyFormat))
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
