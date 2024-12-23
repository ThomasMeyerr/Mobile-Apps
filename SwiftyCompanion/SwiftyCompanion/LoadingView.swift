//
//  LoadingView.swift
//  SwiftyCompanion
//
//  Created by Thomas Meyer on 23/12/2024.
//

import SwiftUI


struct LoadingView: View {
    @StateObject var contentVM: ContentViewModel
    
    init(contentVM: ContentViewModel) {
        self._contentVM = StateObject(wrappedValue: contentVM)
    }

    var body: some View {
        VStack {
            ProgressView()
                .scaleEffect(3)
                .padding(.bottom, 30)
            
            Text("Please log yourself")
                .foregroundStyle(.gray)
            
            Button("here") {
                contentVM.isSheet = true
            }
        }
    }
}

#Preview {
    LoadingView(contentVM: ContentViewModel())
}
