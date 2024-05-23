//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Thomas Meyer on 23/05/2024.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}
