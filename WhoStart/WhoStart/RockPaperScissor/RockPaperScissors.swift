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
        GeometryReader { geometry in
            NavigationStack {
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack(spacing: 30) {
                        ForEach(images, id: \.self) { imageName in
                            NavigationLink(destination: Game(choice: imageName)) {
                                Image(imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                            }
                            .transition(.opacity)
                        }
                    }
                    .padding()
                }
            }
        }
        .accentColor(Color.primary)
    }
}

#Preview {
    RockPaperScissors()
}
