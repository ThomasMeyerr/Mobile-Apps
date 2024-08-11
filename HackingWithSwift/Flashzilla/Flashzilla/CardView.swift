//
//  CardView.swift
//  Flashzilla
//
//  Created by Thomas Meyer on 11/08/2024.
//

import SwiftUI

struct CardView: View {
    let card: Card

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
                .shadow(radius: 10)
            
            VStack {
                Text(card.prompt)
                    .font(.largeTitle)
                    .foregroundStyle(.black)
                
                Text(card.answer)
                    .font(.title)
                    .foregroundStyle(.secondary)
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
    }
}

#Preview {
    CardView(card: .example)
}
