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
            
            Section("Travaux") {
                ForEach(data.works, id: \.self) {
                    Text($0)
                }
            }
        }
        .navigationTitle("Cursus USMB")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    USMB(data: Data())
}
