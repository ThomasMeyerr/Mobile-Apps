//
//  ContentView.swift
//  HabitTracking
//
//  Created by Thomas Meyer on 05/06/2024.
//

import SwiftUI

struct Activity: Identifiable, Codable, Hashable {
    var id = UUID()
    var title: String
    var description: String
}

@Observable
class Data {
    var array: [Activity] {
        didSet {
            saveToUserDefaults()
        }
    }

    init() {
        self.array = [Activity]()
        loadFromUserDefaults()
    }
    
    private let userDefaultKey = "Activities"
    
    func saveToUserDefaults() {
        if let encoded = try? JSONEncoder().encode(array) {
            UserDefaults.standard.set(encoded, forKey: userDefaultKey)
        }
    }
    
    func loadFromUserDefaults() {
        if let savedData = UserDefaults.standard.data(forKey: userDefaultKey) {
            if let decoded = try? JSONDecoder().decode([Activity].self, from: savedData) {
                self.array = decoded
            }
        }
    }
}

struct AddActivity: View {
    var activities: Data
    @State private var title = String()
    @State private var description = String()
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Name of the activity :")
                    .font(.title2)
                    .padding()
                TextField("Example: Natation", text: $title)
                                
                Text("Enter a description :")
                    .font(.title2)
                    .padding()
                TextField("Example : hours of day...", text: $description)
                                
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
            }
            .navigationTitle("Add Activity")
        }
    }
}

struct ShowingActivity: View {
    var activity: Activity

    var body: some View {
        NavigationStack {
            Text("Description:")
                .font(.title2)
                .padding(.bottom)
            
            Text(activity.description)
                .navigationTitle(activity.title)
        }
    }
}

struct ContentView: View {
    var activities = Data()

    var body: some View {
        NavigationStack {
            List {
                ForEach(activities.array) { activity in
                    NavigationLink(activity.title) {
                        ShowingActivity(activity: activity)
                    }
                }
                .onDelete(perform: deleteActivity)
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
    
    func deleteActivity(at offset: IndexSet) {
        activities.array.remove(atOffsets: offset)
    }
}

#Preview {
    ContentView()
}
