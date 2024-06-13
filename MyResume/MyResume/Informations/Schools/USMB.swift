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
            Section {
                ForEach(data.USMBCursus, id: \.self) {
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
