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
    @Published var isAlert = false
    @Published var alertString = ""
    
    init(contentVM: ContentViewModel) {
        self.contentVM = contentVM
    }
    
    func fetchData() async {
        let instance = WebService()
        
        if let downloadedData: User = await instance.downloadData(fromUrl: "https://api.intra.42.fr/users/\(prompt)", code: WebService.code) {
            contentVM.user = downloadedData
            if let downloadedCoalitions: Coalitions = await instance.downloadData(fromUrl: "https://api.intra.42.fr/v2/users/\(downloadedData.id)/coalitions", code: WebService.code) {
                contentVM.coalitions = downloadedCoalitions
            }
            contentVM.isLogged = true
            contentVM.isSheet = false
        } else {
            isAlert = true
            alertString = instance.alertString
        }
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
        VStack {
            Text("Find other students in searchbar")
                .foregroundStyle(.secondary.opacity(0.8))
        }
        .searchable(text: $vm.prompt)
        .onSubmit(of: .search) {
            Task {
                await vm.fetchData()
                if !vm.isAlert {
                    dismiss()
                }
            }
        }
        .alert(isPresented: $vm.isAlert) {
            Alert(title: Text(vm.alertString))
        }
    }
}

#Preview {
    SearchView(contentVM: ContentViewModel())
}
