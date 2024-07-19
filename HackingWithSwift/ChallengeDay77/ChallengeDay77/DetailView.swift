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
    
    @State private var isMapShow = false
    
    var body: some View {
        VStack(alignment: .leading) {
            photo.image
                .resizable()
                .scaledToFit()

            Section {
                Text(photo.name)
                    .font(.title)
                
                Text(photo.description)
                    .font(.subheadline)
            }
            .padding(.leading)
            
            Toggle(isOn: $isMapShow) {
                Text("Show map ?")
            }
            .padding()
            
            if isMapShow {
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
        }
    }
}

#Preview {
    DetailView(photo: .exemple)
}
