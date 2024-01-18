//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Thomas Meyer on 17/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = String()
    
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    
                    Text(self.countries[self.correctAnswer])
                        .foregroundColor(.white)
                }
                
                ForEach(0..<3) { number in
                    Button {
                        self.flagTapped(number)
                    }   label: {
                        Image(self.countries[number])
                    }
                }
            }
        }
        .alert(self.scoreTitle, isPresented: self.$showingScore) {
            Button("Continue", action: askQuestion)
        } message : {
            Text("Your score is ???")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == self.correctAnswer {
            self.scoreTitle = "Correct"
        } else {
            self.scoreTitle = "Wrong"
        }
        
        self.showingScore = true
    }
    
    func askQuestion() {
        self.countries.shuffle()
        self.correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
