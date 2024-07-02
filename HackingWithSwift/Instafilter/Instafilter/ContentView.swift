//
//  ContentView.swift
//  Instafilter
//
//  Created by Thomas Meyer on 28/06/2024.
//

import PhotosUI
import SwiftUI

struct ContentView: View {

    var body: some View {
        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!)
    }
}

#Preview {
    ContentView()
}
