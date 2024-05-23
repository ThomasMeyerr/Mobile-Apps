//
//  ContentView.swift
//  iExpense
//
//  Created by Thomas Meyer on 22/05/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items, id: \.name) { item in
                    Text(item.name)
                }
            }
            .navigationTitle("iExpense")
        }
    }
}

#Preview {
    ContentView()
}
