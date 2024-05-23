//
//  Expenses.swift
//  iExpense
//
//  Created by Thomas Meyer on 23/05/2024.
//

import SwiftUI
import Observation

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONDecoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
}
