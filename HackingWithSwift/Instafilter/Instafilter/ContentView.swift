//
//  ContentView.swift
//  Instafilter
//
//  Created by Thomas Meyer on 28/06/2024.
//

import PhotosUI
import StoreKit
import SwiftUI

struct ContentView: View {
    @Environment(\.requestReview) var requestReview
    let example = Image(.example)

    var body: some View {
        VStack {
            ShareLink(item: example, preview: SharePreview("Lyon drawing", image: example)) {
                Label("Click to share", systemImage: "airplane")
            }
            
            Button("Leave a review") {
                requestReview()
            }
        }
    }
}

#Preview {
    ContentView()
}
