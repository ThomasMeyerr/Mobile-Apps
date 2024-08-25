//
//  ContentView.swift
//  ChallengeDay95
//
//  Created by Thomas Meyer on 25/08/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var diceNumber = 0
    @State private var diceType = 0
    @State private var diceTotal = 0
    
    var body: some View {
        Form {
            Section("Combien de dés ?") {
                TextField("Dice number", value: $diceNumber, formatter: NumberFormatter())
                    .keyboardType(.decimalPad)
            }
            
            Section("Quel type de dé ? 2, 3, 4 faces ou plus ?") {
                TextField("Quel type de dé ? 2, 3, 4 faces ou plus ?", value: $diceType, formatter: NumberFormatter())
                    .keyboardType(.decimalPad)
            }
        }
        .padding()
        .frame(maxHeight: 250)
        
        Button("GO !", action: rollDices)
            .padding()
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(.capsule)
        
        if diceTotal != 0 {
            Text(String(diceTotal))
                .font(.largeTitle)
        }
    }
    
    func rollDices() {
        var dices = [Int]()
        
        for _ in 0..<diceNumber {
            dices.append(Int.random(in: 1...diceType))
        }
        
        diceTotal = dices.reduce(0, +)
    }
}

#Preview {
    ContentView()
}
