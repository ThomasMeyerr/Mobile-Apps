//
//  FlashzillaApp.swift
//  Flashzilla
//
//  Created by Thomas Meyer on 08/08/2024.
//

import SwiftData
import SwiftUI

@main
struct FlashzillaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Card.self)
    }
}
