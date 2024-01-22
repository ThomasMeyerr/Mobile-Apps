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
            VStack {
                NavigationLink(destination: Game(countries: europe), label: {
                    VStack {
                        Text("Europa")
                            .font(.subheadline.weight(.heavy))
                            .foregroundColor(.white)
                        
                        Image("Europa")
                            .resizable()
                            .scaledToFit()
                            .clipShape(.rect(cornerRadius: 10))
                            .shadow(radius: 5)
                    }
                })
                
                HStack(spacing: 10) {
                    NavigationLink(destination: Game(countries: europe), label: {
                        VStack {
                            Text("Africa")
                                .font(.subheadline.weight(.heavy))
                                .foregroundColor(.white)
                            
                            Image("Africa")
                                .resizable()
                                .scaledToFit()
                                .clipShape(.rect(cornerRadius: 10))
                                .shadow(radius: 5)
                        }
                    })
                    
                    NavigationLink(destination: Game(countries: europe), label: {
                        VStack {
                            Text("Asia")
                                .font(.subheadline.weight(.heavy))
                                .foregroundColor(.white)
                            
                            Image("Asia")
                                .resizable()
                                .scaledToFit()
                                .clipShape(.rect(cornerRadius: 10))
                                .shadow(radius: 5)
                        }
                    })
                }
                
                HStack(spacing: 10) {
                    NavigationLink(destination: Game(countries: europe), label: {
                        VStack {
                            Text("America")
                                .font(.subheadline.weight(.heavy))
                                .foregroundColor(.white)
                            
                            Image("America")
                                .resizable()
                                .scaledToFit()
                                .clipShape(.rect(cornerRadius: 10))
                                .shadow(radius: 5)
                        }
                    })
                    
                    NavigationLink(destination: Game(countries: europe), label: {
                        VStack {
                            Text("Oceania")
                                .font(.subheadline.weight(.heavy))
                                .foregroundColor(.white)
                            
                            Image("Oceania")
                                .resizable()
                                .scaledToFit()
                                .clipShape(.rect(cornerRadius: 10))
                                .shadow(radius: 5)
                        }
                    })
                }
            }
            .padding()
        }
    }
}
