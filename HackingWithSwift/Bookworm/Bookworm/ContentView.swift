//
//  ContentView.swift
//  Bookworm
//
//  Created by Thomas Meyer on 13/06/2024.
//

import SwiftData
import SwiftUI

@Model
class Student {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}

struct ContentView: View {
    @Query var students: [Student]
    @Environment(\.modelContext) var modelContext

    var body: some View {
        NavigationStack {
            List(students) { student in
                Text(student.name)
            }
            .navigationTitle("Classroom")
            .toolbar {
                Button("Add") {
                    let firstNames = ["Ginny", "Harry", "Hermione", "Ron", "Luna"]
                    let lastNames = ["Potter", "Weasley", "Lovegood", "Granger"]
                    
                    let chosenFirstNames = firstNames.randomElement()!
                    let chosenLastNames = lastNames.randomElement()!
                    
                    let student = Student(id: UUID(), name: "\(chosenFirstNames) \(chosenLastNames)")
                    modelContext.insert(student)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
