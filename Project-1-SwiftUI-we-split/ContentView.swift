//
//  ContentView.swift
//  Project-1-SwiftUI-we-split
//
//  Created by Kevin Cuadros on 18/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tapCount = 0
    @State private var name = ""
    
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Personal Info", content: {
                    Text("Form")
                })
                Section("Form"){
                    Text("Hello")
                }
                Text("Hello \(name)")
                TextField("Enter your name", text: $name)
                Button("Tap Count: \(tapCount)", action: {
                    self.tapCount += 1
                })
                
                Picker("Select your student", selection: $selectedStudent){
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
                
                Section {
                    ForEach(0..<5) { number in
                        Text("Row: \(number)")
                    }
                }
                
                ForEach(0..<5) {
                    Text("Row: \($0)")
                }
                
            }
            .navigationTitle("Project 1")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    ContentView()
}

