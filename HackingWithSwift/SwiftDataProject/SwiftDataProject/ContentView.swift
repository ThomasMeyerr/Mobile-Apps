//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Thomas Meyer on 20/06/2024.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(filter: #Predicate<User> { user in
        user.name.localizedStandardContains("R") &&
        user.city == "London"
    }, sort: \User.name) var users: [User]
    @State private var showingUpcommingOnly = false
    @State private var sortOrder = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.joinDate),
    ]
    
    var body: some View {
        NavigationStack {
            UsersView(minimumJoinDate: showingUpcommingOnly ? .now : .distantPast, sortOrder: sortOrder)
            .navigationTitle("Users")
            .toolbar {
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Sort by name")
                            .tag([
                                SortDescriptor(\User.name),
                                SortDescriptor(\User.joinDate),
                            ])
                        Text("Sort by Join Date")
                            .tag([
                                SortDescriptor(\User.joinDate),
                                SortDescriptor(\User.name),
                            ])
                    }
                }
                
                Button(showingUpcommingOnly ? "Show Everyone" : "Show Upcoming") {
                    showingUpcommingOnly.toggle()
                }
                
                Button("Add Samples", systemImage: "plus") {
                    try? modelContext.delete(model: User.self)
                    let first = User(name: "Ed Sheeran", city: "London", joinDate: .now.addingTimeInterval(86400 * -10))
                    let second = User(name: "Rosa Diaz", city: "New York", joinDate: .now.addingTimeInterval(86400 * -5))
                    let third = User(name: "Roy Kent", city: "London", joinDate: .now.addingTimeInterval(86400 * 5))
                    let fourth = User(name: "Johnny English", city: "London", joinDate: .now.addingTimeInterval(86400 * 10))

                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(fourth)
                    
                    addSample()
                }
            }
        }
    }
    
    func addSample() {
        let user1 = User(name: "Piper Chapman", city: "New York", joinDate: .now)
        let job1 = Job(name: "Organize sock drawer", priority: 3)
        let job2 = Job(name: "Make plans with Alex", priority: 4)
        
        modelContext.insert(user1)
        
        user1.jobs?.append(job1)
        user1.jobs?.append(job2)
    }
}

#Preview {
    ContentView()
}
