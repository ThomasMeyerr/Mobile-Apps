//
//  RockPaperScissors.swift
//  WhoStart
//
//  Created by Thomas Meyer on 11/01/2024.
//

import SwiftUI

struct RockPaperScissors: View {
    let images = ["Rock", "Paper", "Scissor"]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Text("Rock Paper Scissor ?")
                    .font(Font.system(size: 30, weight: .bold))
                    .foregroundColor(.primary)
                
                Spacer()
                
                NavigationLink(destination: Game(choice: images[0])) {
                    Image(images[0])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 190, height: 190)
                    }
                
                HStack {
                    NavigationLink(destination: Game(choice: images[1])) {
                        Image(images[1])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 190, height: 190)
                        }
                    
                    NavigationLink(destination: Game(choice: images[2])) {
                        Image(images[2])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 190, height: 190)
                        }
                }
                
                Spacer()
            }
            .padding()
        }
        .accentColor(.primary)
    }
}

#Preview {
    RockPaperScissors()
}
