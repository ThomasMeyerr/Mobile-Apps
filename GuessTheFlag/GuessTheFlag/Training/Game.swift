//
//  Game.swift
//  GuessTheFlag
//
//  Created by Thomas Meyer on 19/01/2024.
//

import SwiftUI

struct Game: View {
        
    @State var countries: [String]

    @State private var correctAnswer = Int.random(in: 0...3)
    @State private var previousAnswer = String()
    @State private var score = 0
    @State private var endingGame = false
    @State private var wrongAnswer = String()
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(red: 52/255, green: 103/255, blue: 51/255), .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                VStack(spacing: 8) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.white)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(self.countries[self.correctAnswer])
                            .foregroundStyle(.white)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    Spacer()
                    
                    if self.horizontal() {
                        HStack {
                            ForEach(0..<4) { number in
                                Button {
                                    self.flagTapped(number)
                                }   label: {
                                    FlagImage(name: self.countries[number], size: 150)
                                }
                            }
                        }
                    } else {
                        HStack {
                            ForEach(0..<2) { number in
                                Button {
                                    self.flagTapped(number)
                                }   label: {
                                    FlagImage(name: self.countries[number], size: 170)
                                }
                            }
                        }
                        
                        HStack {
                            ForEach(2..<4) { number in
                                Button {
                                    self.flagTapped(number)
                                }   label: {
                                    FlagImage(name: self.countries[number], size: 170)
                                }
                            }
                        }
                    }
                    
                    Spacer()
                    
                    Text("Score: \(self.score)")
                        .foregroundStyle(.white)
                        .font(.title.bold())
                    
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
        .alert("Wrong! It was \(self.wrongAnswer)", isPresented: self.$endingGame) {
            Button("Restart", role: .cancel, action: reset)
            Button("Menu", role: .destructive) {
                self.presentationMode.wrappedValue.dismiss()
            }
        } message : {
            Text("Your final score is \(self.score) !")
                .font(.title2.weight(.semibold))
                .foregroundColor(.green)
        }
        .onAppear {
            askQuestion()
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
        self.endingGame = false
        askQuestion()
    }
    
    func horizontal() -> Bool {
        if self.horizontalSizeClass == .compact && self.verticalSizeClass == .regular {
            return false
        } else {
            return true
        }
    }
}

#Preview {
    Game(countries: Europe)
}
