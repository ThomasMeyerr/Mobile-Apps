//
//  User.swift
//  SwiftDataProject
//
//  Created by Thomas Meyer on 20/06/2024.
//

import SwiftData
import SwiftUI

@Model
class User {
    var name: String = "Anonymouse"
    var city: String = "Unknown"
    var joinDate: Date = Date.now
    @Relationship(deleteRule: .cascade) var jobs: [Job]? = [Job]()
    
    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}
