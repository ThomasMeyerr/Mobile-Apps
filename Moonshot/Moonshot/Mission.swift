//
//  Mission.swift
//  Moonshot
//
//  Created by Thomas Meyer on 27/05/2024.
//

import SwiftUI

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
}
