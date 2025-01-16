//
//  SearchView.swift
//  SwiftyCompanion
//
//  Created by Thomas Meyer on 16/01/2025.
//

import SwiftUI


@MainActor class SearchViewModel: ObservableObject {
    @Published var prompt = ""
}


struct SearchView: View {
    @StateObject var vm = SearchViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Button("Go back", action: { self.dismiss() })
        }
        .searchable(text: $vm.prompt)
    }
}

#Preview {
    SearchView()
}
