//
//  ProfileView.swift
//  SwiftyCompanion
//
//  Created by Thomas Meyer on 23/12/2024.
//

import SwiftUI


@MainActor class ProfileViewModel: ObservableObject {
    @Published var isAlert = false
}


struct ProfileView: View {
    @ObservedObject var contentVM: ContentViewModel
    @StateObject var vm = ProfileViewModel()
    
    let example = User(id: 1, email: "omg@gmail.com", login: "thmeyer", firstName: "Thomas", lastName: "Meyer", image: UserImage(link: "www.caexistepas.com"), correctionPoint: 3, wallet: 1064, location: nil, active: true)
    
    init(contentVM: ContentViewModel) {
        self._contentVM = ObservedObject(wrappedValue: contentVM)
    }
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: example.image.link)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
                    .scaleEffect(5)
                    .tint(.white)
            }
            .frame(width: 250, height: 250)
            .background(
                Image("Water")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            )
            
            HStack {
                Text("₳ \(example.wallet)")
                
                Text(example.login)
                    .bold()
                
                Group {
                    Text(example.firstName)
                    Text(example.lastName)
                }
                .foregroundStyle(.secondary)
            }
                
            Button {
                vm.isAlert = true
            } label: {
                Image(systemName: "person.crop.circle.badge.xmark.fill")
                    .tint(.red)
            }
        }
        .alert("Are you sure?", isPresented: $vm.isAlert) {
            Button("Yes") {
                contentVM.isLogged = false
                contentVM.isSheet = true
            }
            Button("No", role: .cancel) {}
        }
    }
}

#Preview {
    ProfileView(contentVM: ContentViewModel())
}
