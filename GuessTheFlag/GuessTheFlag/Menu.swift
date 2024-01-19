//
//  Menu.swift
//  GuessTheFlag
//
//  Created by Thomas Meyer on 19/01/2024.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        NavigationStack {
            HStack {
                VStack {
                    NavigationLink(destination: Game(countries: europe), label: {
                        VStack {
                            Text("Europe")
                                .font(.subheadline.weight(.heavy))
                                .foregroundColor(.white)
                            
                            Image("France")
                                .clipShape(.rect(cornerRadius: 10))
                                .shadow(radius: 5)
                        }
                    })
                }
            }
        }
    }
}

#Preview {
    Menu()
}
