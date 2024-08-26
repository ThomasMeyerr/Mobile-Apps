//
//  ContentView.swift
//  ChallengeDay95
//
//  Created by Thomas Meyer on 25/08/2024.
//

import SwiftData
import SwiftUI

@Model
class PreviousDice {
    var total: Int
    
    init(total: Int) {
        self.total = total
    }
}

struct ContentView: View {
    @State private var diceNumber = 0
    @State private var diceType = 0
    @State private var diceTotal = 0
    @Environment(\.modelContext) var modelContext
    @Query var previousDices: [PreviousDice]
    
    var body: some View {
        if !previousDices.isEmpty {
            HStack {
                Text("Jets précédent : ")
                    .font(.headline)
                
                ForEach(previousDices, id: \.self) { dice in
                    Text("\(dice.total)")
                        .padding(.horizontal, 4)
                }
            }
        }
        
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
            .padding(30)
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(.capsule)
            .disabled(diceNumber > 0 && diceType > 1 ? false : true)
        
        if diceTotal != 0 {
            Text("Total des dés : \(diceTotal)")
                .font(.largeTitle)
            
            Button("Save", action: saveData)
        }
    }
    
    func rollDices() {
        var dices = [Int]()
        
        for _ in 0..<diceNumber {
            dices.append(Int.random(in: 1...diceType))
        }
        
        diceTotal = dices.reduce(0, +)
    }
    
    func saveData() {
        let dice = PreviousDice(total: diceTotal)
        modelContext.insert(dice)
        reset()
    }
    
    func reset() {
        diceNumber = 0
        diceType = 0
        diceTotal = 0
    }
}

#Preview {
    ContentView()
}
