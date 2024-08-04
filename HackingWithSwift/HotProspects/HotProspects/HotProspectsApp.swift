//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by Thomas Meyer on 30/07/2024.
//

import SwiftData
import SwiftUI

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
