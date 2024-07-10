//
//  ContentView.swift
//  BucketList
//
//  Created by Thomas Meyer on 09/07/2024.
//

import MapKit
import SwiftUI

struct ContentView: View {
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 48.50, longitude: 2.20),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    
    var body: some View {
        Map(initialPosition: startPosition)
            .mapStyle(.hybrid(elevation: .realistic))
            .onTapGesture { position in
                print("Tapped at \(position)")
            }
    }
}

#Preview {
    ContentView()
}
