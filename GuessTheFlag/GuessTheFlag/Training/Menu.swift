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
            LinearGradient(colors: [Color(red: 52/255, green: 103/255, blue: 51/255), .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                TitleText(title: "Choose a continent :")
                
                NavigationStack {
                    if horizontal() {
                        HStack {
                            ForEach(Array(continents.keys), id: \.self) { name in
                                NavigationLink(destination: Game(countries: continents[name] ?? [String](), title: name), label: {
                                    ContinentImage(name: name)
                                })
                            }
                        }
                        .padding()
                    } else {
                        VStack(spacing: 20) {
                            NavigationLink(destination: Game(countries: Europe, title: "EUROPE"), label: {
                                ContinentImage(name: "Europe")
                            })
                            
                            HStack(spacing: 10) {
                                NavigationLink(destination: Game(countries: Africa, title: "AFRICA"), label: {
                                    ContinentImage(name: "Africa")
                                })
                                
                                NavigationLink(destination: Game(countries: Asia, title: "ASIA"), label: {
                                    ContinentImage(name: "Asia")
                                })
                            }
                            
                            HStack(spacing: 10) {
                                NavigationLink(destination: Game(countries: America, title: "AMERICA"), label: {
                                    ContinentImage(name: "America")
                                })
                                
                                NavigationLink(destination: Game(countries: Oceania, title: "OCEANIA"), label: {
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
