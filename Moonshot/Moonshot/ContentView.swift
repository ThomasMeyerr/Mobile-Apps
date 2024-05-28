//
//  ContentView.swift
//  Moonshot
//
//  Created by Thomas Meyer on 25/05/2024.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationStack {
            LazyVStack {
                ForEach(missions) { mission in
                    NavigationLink {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                    } label: {
                        Text(mission.displayName)
                    }
                }
            }
            .navigationTitle("Mission")
        }
    }
}

#Preview {
    ContentView()
}
