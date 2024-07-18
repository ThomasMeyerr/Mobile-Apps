//
//  USMB.swift
//  MyResume
//
//  Created by Thomas Meyer on 12/06/2024.
//

import SwiftUI

struct USMB: View {
    var data: Data

    var body: some View {
        Form {
            Section("Cursus suivis") {
                DisplayTextsInForm(text1: "Licence Histoire", text2: "2011-2014")
                DisplayTextsInForm(text1: "Master Métiers du Patrimoine", text2: "2016-2018")
            }
            
            Section("Mémoire de fin d'étude") {
                Text(data.memoryName)
                    .font(.title3.italic())
                Text(data.USMBWork)
            }
        }
        .navigationTitle("Cursus USMB")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(DarkModeToolbarModifier())
    }
}

#Preview {
    USMB(data: Data())
}
