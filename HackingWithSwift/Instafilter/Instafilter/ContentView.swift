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
        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!, subject: Text("Learn Swift here"), message: Text("Check out the 100 days of SwiftUI!"))
    }
}

#Preview {
    ContentView()
}
