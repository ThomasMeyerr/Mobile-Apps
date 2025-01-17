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
    @Published var navigateToProfile = false
    @Published var isSearching = false
    
    init(contentVM: ContentViewModel) {
        self.contentVM = contentVM
    }
    
    func fetchData() async {
        let instance = WebService()
        let promptTrimmed = prompt.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        
        if let downloadedData: User = await instance.downloadData(fromUrl: "https://api.intra.42.fr/v2/users/\(promptTrimmed)", code: WebService.code) {
            contentVM.user = downloadedData
            if let downloadedCoalitions: Coalitions = await instance.downloadData(fromUrl: "https://api.intra.42.fr/v2/users/\(downloadedData.id)/coalitions", code: WebService.code) {
                contentVM.coalitions = downloadedCoalitions
            }
        } else {
            isAlert = true
            alertString = instance.alertString
        }
    }
}


struct SearchView: View {
    @ObservedObject var contentVM: ContentViewModel
    @Environment(\.dismiss) var dismiss
    @StateObject var vm: SearchViewModel
    
    init(contentVM: ContentViewModel) {
        self._contentVM = ObservedObject(wrappedValue: contentVM)
        self._vm = StateObject(wrappedValue: SearchViewModel(contentVM: contentVM))
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                if vm.isSearching {
                    ProgressView()
                        .scaleEffect(5)
                } else {
                    Text("Find other students in searchbar")
                        .foregroundStyle(.secondary.opacity(0.8))
                }
            }
            .searchable(text: $vm.prompt)
            .onSubmit(of: .search) {
                Task {
                    vm.isSearching = true
                    await vm.fetchData()
                    if !vm.isAlert {
                        vm.navigateToProfile = true
                    } else {
                        vm.isSearching = false
                    }
                }
            }
            .alert(isPresented: $vm.isAlert) {
                Alert(title: Text(vm.alertString))
            }
            .sheet(isPresented: $vm.navigateToProfile, content: {
                ProfileView(contentVM: contentVM, isSearched: true)
            })
            .onChange(of: vm.navigateToProfile) {
                if !vm.navigateToProfile {
                    vm.isSearching = false
                    vm.prompt = ""
                }
            }
        }
    }
}

#Preview {
    SearchView(contentVM: ContentViewModel())
}
