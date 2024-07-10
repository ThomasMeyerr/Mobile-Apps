//
//  ContentView.swift
//  BucketList
//
//  Created by Thomas Meyer on 09/07/2024.
//

import MapKit
import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Map(interactionModes: [.zoom, .rotate])
            .mapStyle(.hybrid(elevation: .realistic))
    }
}

#Preview {
    ContentView()
}
