//
//  MyResumeApp.swift
//  MyResume
//
//  Created by Thomas Meyer on 12/06/2024.
//

import SwiftUI

@main
struct MyResumeApp: App {
    @StateObject private var data = Data()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(data)
        }
    }
}
