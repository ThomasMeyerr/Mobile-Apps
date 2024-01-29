//
//  Timer.swift
//  GuessTheFlag
//
//  Created by Thomas Meyer on 29/01/2024.
//

import SwiftUI

struct Timer: View {
    
    @State var countries: [String]
    
    @State private var timeRemaining = 60
    @State private var timerIsRunning = false
    
    var body: some View {
        if (self.countries == World) {
            HStack {
                Spacer()
                
                TitleText(title: "\(self.timeRemaining)")
            }
        }
    }
}

#Preview {
    Timer(countries: World)
}
