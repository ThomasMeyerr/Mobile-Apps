//
//  ContentView.swift
//  WordScramble
//
//  Created by Thomas Meyer on 01/05/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        if let URL = Bundle.main.url(forResource: "some_file", withExtension: "txt") {
            if let fileContents = try? String (contentsOf: fileURL) {
                
            }
        }
    }
}

#Preview {
    ContentView()
}
