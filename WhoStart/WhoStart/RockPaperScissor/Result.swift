//
//  Result.swift
//  WhoStart
//
//  Created by Thomas Meyer on 15/01/2024.
//

import SwiftUI

struct Result: View {
    @Environment(\.presentationMode) var presentationMode
    
    let yours: String
    let AI: String

    var body: some View {
        ZStack {
            if yours == "Rock" && AI == "Scissor" || yours == "Paper" && AI == "Rock" || yours == "Scissor" && AI == "Paper" {
                RadialGradient(colors: [.green, .secondary], center: .center, startRadius: 20, endRadius: 500)
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image("Win")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            } else if yours == "Rock" && AI == "Paper" || yours == "Paper" && AI == "Scissor" || yours == "Scissor" && AI == "Rock" {
                RadialGradient(colors: [.secondary, .white], center: .center, startRadius: 20, endRadius: 500)
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image("Loose")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            } else {
                RadialGradient(colors: [.secondary, .white], center: .center, startRadius: 20, endRadius: 500)
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image("Par")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                }
            }
        }
        .ignoresSafeArea()
    }
}
