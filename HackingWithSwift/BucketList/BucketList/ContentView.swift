//
//  ContentView.swift
//  BucketList
//
//  Created by Thomas Meyer on 09/07/2024.
//

import SwiftUI

struct ContentView: View {
    let values = [1, 5, 3, 6, 2, 9].sorted()

    var body: some View {
        List(values, id: \.self) {
            Text(String($0))
        }
    }
}

#Preview {
    ContentView()
}
