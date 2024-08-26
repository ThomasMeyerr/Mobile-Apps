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
    @Environment(\.modelContext) var modelContext
    @Query var previousDices: [PreviousDice]
    @State private var diceNumber = 0
    @State private var diceType = 0
    @State private var diceTotal = 0
    @State private var message = String()
    @State private var done = false
    
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
                TextField("1, 2, 5, 10", value: $diceNumber, formatter: NumberFormatter())
                    .keyboardType(.decimalPad)
            }
            
            Section("Quel type de dé ? 2, 3, 4 faces ou plus ?") {
                TextField("2, 3, 20, 100", value: $diceType, formatter: NumberFormatter())
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
            .sensoryFeedback(.impact, trigger: diceTotal)
            .animation(.easeInOut, value: 1)
        
        if diceTotal != 0 {
            Text(message)
                .font(.largeTitle)
            
            if done {
                Button("Save", action: saveData)
                    .buttonStyle(.borderedProminent)
            }
        }
    }
    
    func rollDices() {
        var dices = [Int]()
    
        for i in 0..<4 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                dices.removeAll()
                for _ in 0..<diceNumber {
                    dices.append(Int.random(in: 1...diceType))
                }
                diceTotal = dices.reduce(0, +)
                message = String(diceTotal)
                
                if i == 3 {
                    done = true
                    message = "Total des dés : \(diceTotal)"
                }
            }
        }
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
        done = false
    }
}

#Preview {
    ContentView()
}
