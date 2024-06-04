//
//  For.swift
//  WeSplit
//
//  Created by Thomas Meyer on 11/01/2024.
//

import SwiftUI

struct For: View {
    let students = ["Choose", "Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Choose"

    var body: some View {
        NavigationStack {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
    }
}

#Preview {
    For()
}
