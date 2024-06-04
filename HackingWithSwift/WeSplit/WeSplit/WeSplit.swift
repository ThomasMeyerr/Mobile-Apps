//
//  WeSplit.swift
//  WeSplit
//
//  Created by Thomas Meyer on 13/01/2024.
//

import SwiftUI

struct WeSplit: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @State private var totalWithTip = 0.0
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = 0..<101
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused(self.$amountIsFocused)
                    Picker("Number of peaople", selection: self.$numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("How much tip do you want to leave?") {
                    Picker("Tip Percentage", selection: self.$tipPercentage) {
                        ForEach(self.tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.wheel)
                }
                
                Section("Total before dividing") {
                    Text(getTotal(), format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .foregroundColor(self.tipPercentage == 0 ? .red : .black)
                }
                
                Section("Amount per person") {
                    Text(self.totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if self.amountIsFocused {
                    Button("done") {
                        self.amountIsFocused = false
                    }
                }
            }
        }
    }
    
    func getTotal() -> Double {
        totalPerPerson * Double(numberOfPeople + 2)
    }
}

#Preview {
    WeSplit()
}
