//
//  ContentView.swift
//  HabitTracking
//
//  Created by Thomas Meyer on 05/06/2024.
//

import SwiftUI

struct Activity: Identifiable {
    var id = UUID()
    var title: String
    var description: String
}

@Observable
class Activities {
    var array: [Activity]

    init() {
        self.array = [Activity]()
    }
}

struct AddActivity: View {
    var body: some View {
        Text("This is the form")
    }
}

struct ShowingActivity: View {
    var activity: Activity

    var body: some View {
        NavigationStack {
            Text(activity.description)
                .navigationTitle(activity.title)
        }
    }
}

struct ContentView: View {
    var activities = Activities()

    var body: some View {
        NavigationStack {
            List(activities.array) { activity in
                Text(activity.title)
            }
            .navigationTitle("List of activities")
            .toolbar {
                NavigationLink {
                    AddActivity()
                } label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
