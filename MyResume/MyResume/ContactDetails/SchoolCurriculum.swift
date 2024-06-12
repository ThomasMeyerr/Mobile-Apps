//
//  SchoolCurriculum.swift
//  MyResume
//
//  Created by Thomas Meyer on 12/06/2024.
//

import SwiftUI

struct SchoolCurriculum: View {
    var data: Data

    var body: some View {
        Form {
            NavigationLink {
                //
            } label: {
                DisplayTextsInForm(text1: "USMB", text2: "2012-2018")
            }
        }
        .navigationTitle("Parcours scolare")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SchoolCurriculum(data: Data())
}
