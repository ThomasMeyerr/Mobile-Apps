//
//  DisplayItem.swift
//  iExpense
//
//  Created by Thomas Meyer on 25/06/2024.
//

import SwiftData
import SwiftUI

struct DisplayItem: View {
    let item: ExpenseItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.type)
            }
            
            Spacer()
            
            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                .font(item.amount < 10 ? .subheadline : item.amount < 100 ? .title3 : .title2)
        }
        .accessibilityElement()
        .accessibilityLabel("\(item.name) \(item.amount)")
        .accessibilityHint(item.type)
    }
}
