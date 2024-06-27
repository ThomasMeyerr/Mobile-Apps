//
//  ChallengeDay60App.swift
//  ChallengeDay60
//
//  Created by Thomas Meyer on 26/06/2024.
//

import SwiftData
import SwiftUI

@main
struct ChallengeDay60App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
