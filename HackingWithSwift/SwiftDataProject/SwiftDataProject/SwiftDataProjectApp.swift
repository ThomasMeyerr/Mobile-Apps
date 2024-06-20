//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Thomas Meyer on 20/06/2024.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
