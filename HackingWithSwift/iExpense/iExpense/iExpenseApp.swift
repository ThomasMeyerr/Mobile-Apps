//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Thomas Meyer on 22/05/2024.
//

import SwiftData
import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
