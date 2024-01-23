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
        ZStack {
            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Text("Choose a continent :")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                NavigationStack {
                    if horizontal() {
                        HStack {
                            ForEach(Array(continents.keys), id: \.self) { name in
                                NavigationLink(destination: Game(countries: continents[name] ?? [String]()), label: {
                                    ContinentImage(name: name)
                                })
                            }
                        }
                        .padding()
                    } else {
                        VStack(spacing: 20) {
                            NavigationLink(destination: Game(countries: Europe), label: {
                                ContinentImage(name: "Europe")
                            })
                            
                            HStack(spacing: 10) {
                                NavigationLink(destination: Game(countries: Africa), label: {
                                    ContinentImage(name: "Africa")
                                })
                                
                                NavigationLink(destination: Game(countries: Asia), label: {
                                    ContinentImage(name: "Asia")
                                })
                            }
                            
                            HStack(spacing: 10) {
                                NavigationLink(destination: Game(countries: America), label: {
                                    ContinentImage(name: "America")
                                })
                                
                                NavigationLink(destination: Game(countries: Oceania), label: {
                                    ContinentImage(name: "Oceania")
                                })
                            }
                        }
                        .padding()
                    }
                }
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
