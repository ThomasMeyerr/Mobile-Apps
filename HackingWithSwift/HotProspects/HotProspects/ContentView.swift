//
//  ContentView.swift
//  HotProspects
//
//  Created by Thomas Meyer on 30/07/2024.
//

import SwiftUI
import UserNotifications

struct ContentView: View {

    var body: some View {
        VStack {
            Button("Request Permission") {
                UNUserNotificationCenter.current().requestAuthorization(options:[.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set !")
                    } else if let error {
                        print(error.localizedDescription)
                    }
                }
            }
            
            Button("Schedule Notification") {
                // Second
            }
        }
    }
}

#Preview {
    ContentView()
}
