//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Thomas Meyer on 17/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    Text("Choose a difficulty :")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    VStack {
                        ForEach(difficulties, id: \.self) { difficulty in
                            NavigationLink(destination: Game(countries: difficulty), label: {
                                VStack {
                                    Text("difficulty")
                                        .font(.subheadline.weight(.semibold))
                                        .foregroundColor(.white)
                                    
                                    Image("US")
                                        .clipShape(.rect(cornerRadius: 10))
                                        .shadow(radius: 5)
                                }
                            })
                        }
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
