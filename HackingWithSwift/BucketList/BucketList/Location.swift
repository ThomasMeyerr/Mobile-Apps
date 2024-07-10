//
//  Location.swift
//  BucketList
//
//  Created by Thomas Meyer on 10/07/2024.
//

import Foundation

struct Location: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double
}
