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
        Text(data.USMBCursus)
    }
}

#Preview {
    USMB(data: Data())
}
