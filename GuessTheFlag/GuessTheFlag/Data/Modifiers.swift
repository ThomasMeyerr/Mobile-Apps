//
//  Modifiers.swift
//  GuessTheFlag
//
//  Created by Thomas Meyer on 01/02/2024.
//

import SwiftUI

/* ------- IMAGE COMPOSITION ------- */
struct ContinentImage: View {
    var name: String
    
    var body: some View {
        VStack {
            Text(self.name)
                .font(.subheadline.weight(.heavy))
                .foregroundColor(.white)
            
            Image(self.name)
                .resizable()
                .scaledToFit()
                .clipShape(.rect(cornerRadius: 10))
                .shadow(radius: 5)
        }
    }
}

struct FlagImage: View {
    var name: String
    var size: CGFloat
    
    var body: some View {
        Image(self.name)
            .resizable()
            .clipShape(Circle())
            .scaledToFill()
            .frame(width: self.size, height: self.size)
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .shadow(radius: 5)
    }
}


/* ------- TITLE TEXT ------- */
struct TitleText: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.largeTitle.bold())
            .foregroundColor(.white)
    }
}

/* ------- HEAVY TEXT ------- */
struct HeavyText: View {
    let heavy: String
    
    var body: some View {
        Text(heavy)
            .foregroundStyle(.white)
            .font(.subheadline.weight(.heavy))
    }
}

/* ------- LEADERBOARD VIEW ------- */
struct LeaderboardView: View {
    let name: String
    let score: Int
    
    var body: some View {
        HStack {
            Text(name)
            
            Spacer()
            
            Text("\(score)")
        }
        .padding()
    }
}
