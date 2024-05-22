//
//  Game.swift
//  GuessTheFlag
//
//  Created by Thomas Meyer on 19/01/2024.
//

import SwiftUI

struct Game: View {
    @State var countries: [String]
    @State var title: String
    
    @State private var correctAnswer = Int.random(in: 0...3)
    @State private var previousAnswer = String()
    @State private var score = 0
    @State private var timeRemaining = 60
    @State private var endingGame = false
    @State private var timerEnd = false
    @State private var wrongAnswer = String()
    @State private var pseudo = String()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [Color(red: 52/255, green: 103/255, blue: 51/255), .black], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    TimeCounter(countries: self.countries, timeRemaining: self.$timeRemaining, endingGame: self.$timerEnd)
                    
                    TitleText(title: self.title)
                    
                    TitleText(title: "Guess the flag")
                    
                    VStack(spacing: 8) {
                        VStack {
                            HeavyText(heavy: "Tap the flag of")
                            
                            Text(self.countries[self.correctAnswer])
                                .foregroundStyle(.white)
                                .font(.largeTitle.weight(.semibold))
                        }
                        
                        Spacer()
                        
                        HStack {
                            ForEach(0..<2) { number in
                                Button {
                                    self.flagTapped(number)
                                } label: {
                                    FlagImage(name: self.countries[number], size: 170)
                                }
                            }
                        }
                        
                        HStack {
                            ForEach(2..<4) { number in
                                Button {
                                    self.flagTapped(number)
                                } label: {
                                    FlagImage(name: self.countries[number], size: 170)
                                }
                            }
                        }
                        
                        Spacer()
                        
                        TitleText(title: "Score: \(self.score)")
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background {
                        Color.white
                            .blur(radius: 400)
                    }
                    .clipShape(.rect(cornerRadius: 20))
                }
                .padding()
            }
            .alert("Wrong! It was \(self.wrongAnswer) !\n Score: \(self.score)", isPresented: self.$endingGame) {
                Button("Restart", role: .cancel, action: reset)
                Button("Menu", role: .destructive) {
                    if score > UserDefaults.standard.integer(forKey: "MaxScore") {
                        UserDefaults.standard.set(score, forKey: "MaxScore")
                    }
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
            .alert("Running out of time !\n Score: \(self.score)", isPresented: self.$timerEnd) {
                Button("Restart", role: .cancel, action: reset)
                Button("Menu", role: .destructive) {
                    if score > UserDefaults.standard.integer(forKey: "MaxScore") {
                        UserDefaults.standard.set(score, forKey: "MaxScore")
                    }
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
            .onAppear {
                askQuestion()
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == self.correctAnswer {
            self.score += 1
            self.previousAnswer = self.countries[self.correctAnswer]
        } else {
            self.endingGame = true
            self.wrongAnswer = self.countries[number]
            return;
        }
        askQuestion()
    }
    
    func askQuestion() {
        self.countries.shuffle()
        self.correctAnswer = Int.random(in: 0...3)
        if (self.previousAnswer == self.countries[self.correctAnswer]) {
            askQuestion()
        }
    }
    
    func reset() {
        self.score = 0
        self.timeRemaining = 60
        self.timerEnd = false
        self.endingGame = false
        askQuestion()
    }
}

#Preview {
    Game(countries: World, title: "WORLD")
}
