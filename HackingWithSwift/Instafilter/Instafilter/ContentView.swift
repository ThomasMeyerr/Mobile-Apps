//
//  ContentView.swift
//  Instafilter
//
//  Created by Thomas Meyer on 28/06/2024.
//

import PhotosUI
import SwiftUI

struct ContentView: View {
    let example = Image(.example)

    var body: some View {
        ShareLink(item: example, preview: SharePreview("Lyon drawing", image: example)) {
            Label("Click to share", systemImage: "airplane")
        }
    }
}

#Preview {
    ContentView()
}
