//
//  Ranked.swift
//  GuessTheFlag
//
//  Created by Thomas Meyer on 23/01/2024.
//

import SwiftUI

struct Ranked: View {
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [Color(red: 52/255, green: 103/255, blue: 51/255), .black], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()

                NavigationLink {
                    Game(countries: World, title: "WORLD")
                } label : {
                    VStack {
                        TitleText(title: "CLICK TO START")
                        
                        HeavyText(heavy: "Timer 60s")
                        
                        Image("Globe")
                            .resizable()
                            .scaledToFit()
                            .padding()
                    }
                }
            }
        }
        .accentColor(.white)
    }
}

#Preview {
    Ranked()
}
