//
//  ContentView.swift
//  iExpense
//
//  Created by Thomas Meyer on 22/05/2024.
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
    }
}

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \ExpenseItem.name) var expenses: [ExpenseItem]
    
    var body: some View {
        NavigationStack {
            List {
                Section("Personal") {
                    ForEach(expenses) { item in
                        if item.type == "Personal" {
                            DisplayItem(item: item)
                        }
                    }
                    .onDelete(perform: removeItems)
                }
                
                Section("Business") {
                    ForEach(expenses) { item in
                        if item.type == "Business" {
                            DisplayItem(item: item)
                        }
                    }
                    .onDelete(perform: removeItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                NavigationLink("Add Expense") {
                    AddView()
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        for offset in offsets {
            let item = expenses[offset]
            modelContext.delete(item)
        }
    }
}

#Preview {
    ContentView()
}
