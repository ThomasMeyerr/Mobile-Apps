//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Thomas Meyer on 29/08/2024.
//

import SwiftUI


@Observable
class Favorites {
    // the actual resorts the user has favorited
    private var resorts: Set<String>
    
    // the key we're using to read/write in UserDefaults
    private let key = "Favorites"
    
    init() {
        // load our saved data
        
        resorts = []
    }
    
    // returns true if our set contains this resort
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    // adds the resort to our set and saves the change
    func add(_ resort: Resort) {
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort) {
        resorts.remove(resort.id)
        save()
    }
    
    func save() {
        
    }
}
