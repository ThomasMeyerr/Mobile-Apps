//
//  ContentView.swift
//  HabitTracking
//
//  Created by Thomas Meyer on 05/06/2024.
//

import SwiftUI

struct Activity: Identifiable, Hashable {
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
    var activities: Activities
    @State private var title = String()
    @State private var description = String()
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Spacer()
                
                Text("Name of the activity :")
                    .font(.title2)
                    .padding()
                TextField("Example: Natation", text: $title)
                
                Spacer()
                
                Text("Enter a description :")
                    .font(.title2)
                    .padding()
                TextField("Example : hours of day...", text: $description)
                
                Spacer()
                
                Button {
                    if title != "" && description != "" {
                        let activity = Activity(title: title, description: description)
                        activities.array.append(activity)
                    }
                    dismiss()
                } label: {
                    Text("Done")
                        .font(.title)
                        .foregroundStyle(.green)
                        .padding()
                }
                
                Spacer()
            }
            .navigationTitle("Add Activity")
        }
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
                NavigationLink(activity.title, value: activity)
            }
            .navigationTitle("List of activities")
            .toolbar {
                NavigationLink {
                    AddActivity(activities: activities)
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
