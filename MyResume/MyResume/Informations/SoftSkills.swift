//
//  SoftSkills.swift
//  MyResume
//
//  Created by Thomas Meyer on 12/06/2024.
//

import SwiftUI

struct SoftSkills: View {
    var data: Data

    var body: some View {
        Form {
            Section {
                ForEach(data.softSkills, id: \.self) { skill in
                    Text(skill)
                }
            }
        }
        .navigationTitle("Compétences")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SoftSkills(data: Data())
}
