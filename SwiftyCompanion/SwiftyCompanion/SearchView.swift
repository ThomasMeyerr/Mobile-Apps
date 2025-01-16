//
//  SearchView.swift
//  SwiftyCompanion
//
//  Created by Thomas Meyer on 16/01/2025.
//

import SwiftUI

struct SearchView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button("Go back", action: { self.dismiss() })
    }
}

#Preview {
    SearchView()
}
