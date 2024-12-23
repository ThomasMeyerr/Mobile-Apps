//
//  ProfileView.swift
//  SwiftyCompanion
//
//  Created by Thomas Meyer on 23/12/2024.
//

import SwiftUI


struct ProfileView: View {
    @StateObject var contentVM: ContentViewModel
    
    init(contentVM: ContentViewModel) {
        self._contentVM = StateObject(wrappedValue: contentVM)
    }
    
    var body: some View {
        VStack {
            Text("Here we are")
            
            Button("Log out") {
                contentVM.isLogged = false
                contentVM.isSheet = true
            }
            .foregroundStyle(.red)
        }
    }
}

#Preview {
    ProfileView(contentVM: ContentViewModel())
}
