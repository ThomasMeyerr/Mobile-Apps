//
//  Leaderboard.swift
//  GuessTheFlag
//
//  Created by Thomas Meyer on 23/01/2024.
//

import SwiftUI

struct Leaderboard: View {
    @State private var index = 0
        
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(red: 52/255, green: 103/255, blue: 51/255), .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                TitleText(title: "LEADERBOARD")
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    HeavyText(heavy: "NAME")
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    HeavyText(heavy: "SCORE")
                    
                    Spacer()
                }
                
                List(leaderboard.sorted(by: { $0.value > $1.value }), id: \.key) { (name, score) in
                    LeaderboardView(name: name, score: score)
                }
            }
            .padding()
        }
    }
}

#Preview {
    Leaderboard()
}
