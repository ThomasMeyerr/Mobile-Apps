//
//  Missions.swift
//  Moonshot
//
//  Created by Thomas Meyer on 27/05/2024.
//

import SwiftUI

struct CrewRole: Codable {
    let name: String
    let role: String
}

struct Missions: Codable, Identifiable {
    let id: Int
    let launchDate: String
    let crews: [CrewRole]
    let description: String
}
