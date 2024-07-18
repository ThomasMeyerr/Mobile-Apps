//
//  ExperiencePro.swift
//  MyResume
//
//  Created by Thomas Meyer on 13/06/2024.
//

import SwiftUI

struct ExperiencePro: View {
    var data: Data

    var body: some View {
        Form {
            ForEach(data.jobName.indices, id: \.self) { i in
                Section(data.jobPlace[i]) {
                    DisplayTextsInForm(text1: data.jobName[i], text2: data.jobDate[i])
                    Text(data.jobDescription[i])
                        .font(.caption)
                }
            }
        }
        .navigationTitle("Expériences professionnelles")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(DarkModeToolbarModifier())
    }
}

#Preview {
    ExperiencePro(data: Data())
}
