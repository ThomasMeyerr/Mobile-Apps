//
//  ContentView.swift
//  iExpense
//
//  Created by Thomas Meyer on 22/05/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        VStack {
            List {
                ForEach(numbers, id: \.self) {
                    Text("Row \($0)")
                }
            }
            
            Button("Add Number") {
                numbers.append(currentNumber)
                currentNumber += 1
            }
        }
    }
}

#Preview {
    ContentView()
}
