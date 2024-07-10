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
        MapReader { proxy in
            Map(initialPosition: startPosition)
                .mapStyle(.hybrid(elevation: .realistic))
                .onTapGesture { position in
                    if let coordinate = proxy.convert(position, from: .local) {
                        print("Tapped at \(coordinate)")
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
