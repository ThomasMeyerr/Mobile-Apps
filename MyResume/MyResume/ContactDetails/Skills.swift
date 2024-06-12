//
//  Skills.swift
//  MyResume
//
//  Created by Thomas Meyer on 12/06/2024.
//

import SwiftUI

struct Skills: View {
    var data: Data

    var body: some View {
        Form {
            Section {
                ForEach(data.skills, id: \.self) { skill in
                    Text(skill)
                }
            }
        }
        .navigationTitle("Compétences")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    Skills(data: Data())
}
