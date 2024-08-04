//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Thomas Meyer on 04/08/2024.
//

import SwiftUI

struct ProspectsView: View {
    enum FilterType {
        case none, contacted, uncontacted
    }
    
    let filter: FilterType
    var title: String {
        switch filter {
        case .none:
            "Everyone"
        case .contacted:
            "Contacted people"
        case .uncontacted:
            "Uncontacted people"
        }
    }

    var body: some View {
        NavigationStack {
            Text("Hello, world!")
                .navigationTitle(title)
        }
    }
}

#Preview {
    ProspectsView(filter: .none)
}
