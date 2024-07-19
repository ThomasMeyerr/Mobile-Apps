//
//  DetailView.swift
//  ChallengeDay77
//
//  Created by Thomas Meyer on 19/07/2024.
//

import MapKit
import SwiftUI

struct DetailView: View {
    let photo: Photo
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                photo.image
                    .resizable()
                    .scaledToFit()
                
                if let location = photo.location {
                    Map(initialPosition: MapCameraPosition.region(
                        MKCoordinateRegion(
                            center: location,
                            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
                        )
                    )) {
                        Marker(photo.name, coordinate: location)
                    }
                }
            }

            Section {
                Text(photo.name)
                    .font(.title)
                
                Text(photo.description)
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    DetailView(photo: .exemple)
}
