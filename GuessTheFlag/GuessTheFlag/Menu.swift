//
//  Menu.swift
//  GuessTheFlag
//
//  Created by Thomas Meyer on 19/01/2024.
//

import SwiftUI

struct Menu: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        NavigationStack {
            if horizontal() {
                HStack {
                    NavigationLink(destination: Game(countries: Europa), label: {
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
                    
                    NavigationLink(destination: Game(countries: Africa), label: {
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
                    
                    NavigationLink(destination: Game(countries: Asia), label: {
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
                    
                    NavigationLink(destination: Game(countries: America), label: {
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
                    
                    NavigationLink(destination: Game(countries: Oceania), label: {
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
                .padding()
            } else {
                VStack {
                    NavigationLink(destination: Game(countries: Europa), label: {
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
                        NavigationLink(destination: Game(countries: Europa), label: {
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
                        
                        NavigationLink(destination: Game(countries: Europa), label: {
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
                        NavigationLink(destination: Game(countries: Europa), label: {
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
                        
                        NavigationLink(destination: Game(countries: Europa), label: {
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
    
    func horizontal() -> Bool {
        if self.horizontalSizeClass == .compact && self.verticalSizeClass == .regular {
            return false
        } else {
            return true
        }
    }
}
