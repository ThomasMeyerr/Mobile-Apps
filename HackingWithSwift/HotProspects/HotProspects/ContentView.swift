//
//  ContentView.swift
//  HotProspects
//
//  Created by Thomas Meyer on 30/07/2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Image(.example)
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .background(.black)
    }
}

#Preview {
    ContentView()
}
