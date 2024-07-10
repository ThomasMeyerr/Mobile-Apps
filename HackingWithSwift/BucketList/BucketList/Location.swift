//
//  Location.swift
//  BucketList
//
//  Created by Thomas Meyer on 10/07/2024.
//

import Foundation
import MapKit

struct Location: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
