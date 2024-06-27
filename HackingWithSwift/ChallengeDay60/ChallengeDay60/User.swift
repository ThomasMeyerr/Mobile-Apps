//
//  User.swift
//  ChallengeDay60
//
//  Created by Thomas Meyer on 26/06/2024.
//

import Foundation
import SwiftData

@Model
class User: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case isActive = "isActive"
        case name = "name"
        case age = "age"
        case company = "company"
        case email = "email"
        case address = "address"
        case about = "about"
        case registered = "registered"
        case tags = "tags"
        case friends = "friends"
    }
    
    var id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.isActive = try container.decode(Bool.self, forKey: .isActive)
        
        
    }
    
    func encode(to encoder: Encoder) throws {
        <#code#>
    }
}
