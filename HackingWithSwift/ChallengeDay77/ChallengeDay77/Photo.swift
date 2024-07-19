//
//  Photo.swift
//  ChallengeDay77
//
//  Created by Thomas Meyer on 19/07/2024.
//

import SwiftUI

struct Photo: Identifiable, Codable, Comparable {
    var id: UUID
    var name: String
    var description: String
    var imageData: Data
    
    var image: Image {
        Image(uiImage: UIImage(data: imageData) ?? UIImage())
    }
    
    static func <(lhs: Photo, rhs: Photo) -> Bool {
        lhs.name < rhs.name
    }
    
    #if DEBUG
    static let exemple = Photo(id: UUID(), name: "Random photo", description: "Just a regular random photo", imageData: Data())
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
