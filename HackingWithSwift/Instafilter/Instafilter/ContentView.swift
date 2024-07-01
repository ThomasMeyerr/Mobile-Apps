//
//  ContentView.swift
//  Instafilter
//
//  Created by Thomas Meyer on 28/06/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var image: Image?

    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }
    
    func loadImage() {
        image = Image(.example)
    }
}

#Preview {
    ContentView()
}
