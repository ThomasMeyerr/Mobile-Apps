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
            ForEach(0..<data.jobName.count) { i in
                Section(data.jobPlace[i]) {
                    DisplayTextsInForm(text1: data.jobName[i], text2: data.jobDate[i])
                    Text(data.jobDescription[i])
                        .font(.caption)
                }
            }
        }
        .navigationTitle("Expériences professionnelles")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ExperiencePro(data: Data())
}
