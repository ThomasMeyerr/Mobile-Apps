//
//  SearchView.swift
//  SwiftyCompanion
//
//  Created by Thomas Meyer on 16/01/2025.
//

import SwiftUI


@MainActor class SearchViewModel: ObservableObject {
    @ObservedObject var contentVM: ContentViewModel
    @Published var prompt = ""
    
    init(contentVM: ContentViewModel) {
        self.contentVM = contentVM
    }
}


struct SearchView: View {
    @ObservedObject var contentVM: ContentViewModel
    @StateObject var vm: SearchViewModel
    @Environment(\.dismiss) var dismiss
    
    init(contentVM: ContentViewModel) {
        self._contentVM = ObservedObject(wrappedValue: contentVM)
        self._vm = StateObject(wrappedValue: SearchViewModel(contentVM: contentVM))
    }
    
    var body: some View {
        NavigationStack {
            Button("Go back", action: { self.dismiss() })
        }
        .searchable(text: $vm.prompt)
    }
}

#Preview {
    SearchView(contentVM: ContentViewModel())
}
