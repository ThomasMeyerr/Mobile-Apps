//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by Thomas Meyer on 12/07/2024.
//

import CoreLocation
import Foundation
import MapKit

extension ContentView {
    @Observable
    class ViewModel {
        private(set) var locations = [Location]()
        var selectedPlace: Location?
        
        func addLocation(at point: CLLocationCoordinate2D) {
            let newLocation = Location(id: UUID(), name: "New Location", description: "", latitude: point.latitude, longitude: point.longitude)
            locations.append(newLocation)
        }
    }
}
