//
//  Result.swift
//  WhoStart
//
//  Created by Thomas Meyer on 15/01/2024.
//

import SwiftUI

struct Result: View {
    let yours: String
    let AI: String

    var body: some View {
        if yours == "Rock" && AI == "Scissor" || yours == "Paper" && AI == "Rock" || yours == "Scissor" && AI == "Paper" {
            NavigationLink(destination: RockPaperScissors()) {
                Image("Win")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        } else if yours == "Rock" && AI == "Paper" || yours == "Paper" && AI == "Scissor" || yours == "Scissor" && AI == "Rock" {
            NavigationLink(destination: RockPaperScissors()) {
                Image("Loose")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        } else {
            NavigationLink(destination: RockPaperScissors()) {
                Image("Par")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}
