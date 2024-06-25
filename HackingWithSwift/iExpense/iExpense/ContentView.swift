//
//  ContentView.swift
//  iExpense
//
//  Created by Thomas Meyer on 22/05/2024.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \ExpenseItem.name) var expenses: [ExpenseItem]
    @State private var sortOrder = [
        SortDescriptor(\ExpenseItem.name),
        SortDescriptor(\ExpenseItem.amount),
    ]
    @State private var showingMenu = String()
    
    var body: some View {
        NavigationStack {
            ExpensesView(sortOrder: sortOrder, showingMenu: showingMenu)
            .navigationTitle("iExpense")
            .toolbar {
                Menu("Switch sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Sort by name")
                            .tag([
                                SortDescriptor(\ExpenseItem.name),
                                SortDescriptor(\ExpenseItem.amount),
                            ])
                        Text("Sort by amount")
                            .tag([
                                SortDescriptor(\ExpenseItem.amount),
                                SortDescriptor(\ExpenseItem.name),
                            ])
                    }
                }
                
                Menu("Switch menu", systemImage: "filemenu.and.cursorarrow") {
                    Picker("Sort menu", selection: $showingMenu) {
                        Text("All")
                            .tag(String())
                        
                        Text("Personal")
                            .tag("Personal")
                        
                        Text("Business")
                            .tag("Business")
                    }
                }
                
                NavigationLink("Add Expense") {
                    AddView()
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
