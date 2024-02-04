//
//  TimeCounter.swift
//  GuessTheFlag
//
//  Created by Thomas Meyer on 29/01/2024.
//

import SwiftUI

struct TimeCounter: View {
    @State var countries: [String]
    @Binding var timeRemaining: Int
    @Binding var endingGame: Bool
    
    var body: some View {
        if (self.countries == World) {
            HStack {
                Spacer()
                
                TitleText(title: "\(self.timeRemaining)")
            }
            .onChange(of: self.endingGame) {
                startTimer()
            }
            .onAppear {
                startTimer()
            }
        }
    }
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                timer.invalidate()
                self.endingGame = true
            }
        }
    }
}
