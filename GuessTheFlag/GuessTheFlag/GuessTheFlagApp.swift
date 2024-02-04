//
//  GuessTheFlagApp.swift
//  GuessTheFlag
//
//  Created by Thomas Meyer on 17/01/2024.
//

import SwiftUI

@main
struct GuessTheFlagApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
 
