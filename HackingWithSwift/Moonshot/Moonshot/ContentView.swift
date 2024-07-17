//
//  ContentView.swift
//  Moonshot
//
//  Created by Thomas Meyer on 25/05/2024.
//

import SwiftUI

struct GridLayout: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    VStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding()
                        
                        VStack {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundStyle(.white)
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.5))
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(.lightBackground)
                    }
                    .clipShape(.rect(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    )
                    .accessibilityElement()
                    .accessibilityLabel(mission.displayName)
                    .accessibilityHint(mission.formattedLaunchDate)
                    .accessibilityAddTraits(.isButton)
                }
            }
        }
        .padding([.horizontal, .bottom])
    }
}

struct ListLayout: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    var body: some View {
        List(missions) { mission in
            Text(mission.displayName)
//            NavigationLink {
//                MissionView(mission: mission, astronauts: astronauts)
//            } label: {
//                VStack {
//                    Image(mission.image)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 100, height: 100)
//                        .padding()
//
//                    VStack {
//                        Text(mission.displayName)
//                            .font(.headline)
//                            .foregroundStyle(.white)
//                        Text(mission.formattedLaunchDate)
//                            .font(.caption)
//                            .foregroundStyle(.white.opacity(0.5))
//                    }
//                    .padding(.vertical)
//                    .frame(maxWidth: .infinity)
//                    .background(.lightBackground)
//                }
//                .clipShape(.rect(cornerRadius: 10))
//                .overlay(
//                    RoundedRectangle(cornerRadius: 10)
//                        .stroke(.lightBackground)
//                )
//            }
        }
        .listStyle(.plain)
        .listRowBackground(Color.darkBackground)
        .padding([.horizontal, .bottom])
    }
}

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showingGrid = true
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Group {
                    if showingGrid {
                        GridLayout(astronauts: astronauts, missions: missions)
                    } else {
                        ListLayout(astronauts: astronauts, missions: missions)
                    }
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button {
                    showingGrid.toggle()
                } label: {
                    Image(systemName: showingGrid ? "switch.programmable.fill" : "switch.programmable")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30)
                        .foregroundStyle(.white)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
