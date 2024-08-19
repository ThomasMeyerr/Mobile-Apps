//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Thomas Meyer on 19/08/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            VStack {
                Text("@Modzie")
                Image(.example)
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            
            VStack {
                Text("Full name:")
                Text("THOMAS MEYER")
                    .font(.largeTitle)
            }
        }
    }
}

#Preview {
    ContentView()
}
