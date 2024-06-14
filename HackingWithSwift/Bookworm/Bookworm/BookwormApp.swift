//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Thomas Meyer on 13/06/2024.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
