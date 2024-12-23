//
//  ContentView.swift
//  SwiftyCompanion
//
//  Created by Thomas Meyer on 05/12/2024.
//

import SwiftUI


@MainActor class ContentViewModel: ObservableObject {
    @Published var isSheet = false
    @Published var isLogged = false
    @Published var data = [Data]()
}


struct ContentView: View {
    @StateObject var vm = ContentViewModel()

    var body: some View {
        ZStack {
            if !vm.isLogged {
                LoadingView(contentVM: vm)
            } else {
                ProfileView(contentVM: vm)
            }
        }
        .onAppear() {
            vm.isSheet = true
        }
        .sheet(isPresented: $vm.isSheet, content: {
            LoginView(contentVM: vm)
        })
    }
}

#Preview {
    ContentView()
}
