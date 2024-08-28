//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by Thomas Meyer on 28/08/2024.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to SnowSeeker!")
                .font(.largeTitle)
            
            Text("Please select a resort from the left-hand menu; swip from the left edge to show it.")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    WelcomeView()
}
