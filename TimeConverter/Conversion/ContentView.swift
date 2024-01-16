//
//  ContentView.swift
//  Conversion
//
//  Created by Thomas Meyer on 16/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var initUnit: Int?
    @State private var timeUnit = String()
    @State private var resultUnit = String()
    
    let timeUnits = ["Seconds", "Minutes", "Hours", "Days"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Choose a time to convert") {
                    TextField("Time in number", value: self.$initUnit, format: .number)
                    
                    Picker("Time unit", selection:  self.$timeUnit) {
                        ForEach(self.timeUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Result") {
                    Picker("Final unit", selection: self.$resultUnit) {
                        ForEach(self.timeUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Text("\(self.initUnit ?? 0) \(self.timeUnit) = \(calculateTime()) \(self.resultUnit)")
                }
            }
            .navigationTitle("Time Converter")
        }
    }
    
    func calculateTime() -> Int {
        let baseUnit: Int
        
        if self.timeUnit == "Seconds" {
            baseUnit = self.initUnit ?? 0
        } else if self.timeUnit == "Minutes" {
            baseUnit = (self.initUnit ?? 0) * 60
        } else if self.timeUnit == "Hours" {
            baseUnit = (self.initUnit ?? 0) * 3600
        } else {
            baseUnit = (self.initUnit ?? 0) * 86400
        }
        
        switch self.resultUnit {
        case "Seconds":
            return baseUnit
        case "Minutes":
            return baseUnit / 60
        case "Hours":
            return baseUnit / 3600
        case "Days":
            return baseUnit / 86400
        default:
            return 0
        }
    }
}

#Preview {
    ContentView()
}
