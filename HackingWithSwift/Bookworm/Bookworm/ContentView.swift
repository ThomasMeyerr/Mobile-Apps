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
        }
    }
}

#Preview {
    ContentView()
}
