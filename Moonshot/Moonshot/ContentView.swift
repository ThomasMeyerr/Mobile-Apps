//
//  ContentView.swift
//  Moonshot
//
//  Created by Thomas Meyer on 25/05/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink {
                Text("Detail View")
            } label: {
                VStack {
                    Text("This is the label")
                    Text("So is this")
                    Image(systemName: "face.smiling")
                }
                .font(.largeTitle)
            }
        }
    }
}

#Preview {
    ContentView()
}
