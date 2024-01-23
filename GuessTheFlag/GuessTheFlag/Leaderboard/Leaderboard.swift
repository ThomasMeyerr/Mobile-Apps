//
//  Leaderboard.swift
//  GuessTheFlag
//
//  Created by Thomas Meyer on 23/01/2024.
//

import SwiftUI

struct Leaderboard: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    Leaderboard()
}
