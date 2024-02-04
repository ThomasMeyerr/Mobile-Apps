//
//  Menu.swift
//  GuessTheFlag
//
//  Created by Thomas Meyer on 19/01/2024.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(red: 52/255, green: 103/255, blue: 51/255), .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                TitleText(title: "Choose a continent :")
                
                NavigationStack {
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
