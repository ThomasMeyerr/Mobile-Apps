//
//  Photo.swift
//  ChallengeDay77
//
//  Created by Thomas Meyer on 19/07/2024.
//

import CoreLocation
import SwiftUI

struct Photo: Identifiable, Codable, Comparable {
    var id: UUID
    var name: String
    var description: String
    var imageData: Data
    var location: CLLocationCoordinate2D?
    
    var image: Image {
        Image(uiImage: UIImage(data: imageData) ?? UIImage())
    }
    
    static func <(lhs: Photo, rhs: Photo) -> Bool {
        lhs.name < rhs.name
    }
    
    static func ==(lhs: Photo, rhs: Photo) -> Bool {
        lhs.name == rhs.name
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case imageData
        case location
    }
      
    enum LocationCodingKeys: String, CodingKey {
        case latitude
        case longitude
    }
      
    init(id: UUID, name: String, description: String, imageData: Data, location: CLLocationCoordinate2D?) {
        self.id = id
        self.name = name
        self.description = description
        self.imageData = imageData
        self.location = location
    }
      
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        description = try container.decode(String.self, forKey: .description)
        imageData = try container.decode(Data.self, forKey: .imageData)

        if let locationContainer = try? container.nestedContainer(keyedBy: LocationCodingKeys.self, forKey: .location) {
          let latitude = try locationContainer.decode(CLLocationDegrees.self, forKey: .latitude)
          let longitude = try locationContainer.decode(CLLocationDegrees.self, forKey: .longitude)
          location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        } else {
          location = nil
        }
    }
      
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(description, forKey: .description)
        try container.encode(imageData, forKey: .imageData)

        if let location = location {
          var locationContainer = container.nestedContainer(keyedBy: LocationCodingKeys.self, forKey: .location)
          try locationContainer.encode(location.latitude, forKey: .latitude)
          try locationContainer.encode(location.longitude, forKey: .longitude)
        }
    }
    
    #if DEBUG
    static let exemple = Photo(id: UUID(), name: "Random photo", description: "Just a regular random photo", imageData: Data(), location: CLLocationCoordinate2D(latitude: 53, longitude: 53))
    #endif
}

struct Photos {
    let savePath = URL.documentsDirectory.appending(path: "PhotoSaver")

    var array: [Photo]
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            array = try JSONDecoder().decode([Photo].self, from: data)
            array.sort {
                $0.name > $1.name
            }
        } catch {
            array = []
        }
    }
}
