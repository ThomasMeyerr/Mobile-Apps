//
//  ProfileView.swift
//  SwiftyCompanion
//
//  Created by Thomas Meyer on 23/12/2024.
//

import SwiftUI


struct ProfileView: View {
    @StateObject var contentVM: ContentViewModel
    let example = User(id: 1, email: "omg@gmail.com", login: "thmeyer", firstName: "Thomas", lastName: "Meyer", image: UserImage(link: "www.caexistepas.com"), correctionPoint: 3, wallet: 1064, location: nil, active: true)
    
    init(contentVM: ContentViewModel) {
        self._contentVM = StateObject(wrappedValue: contentVM)
    }
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: example.image.link)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
                    .scaleEffect(5)
                    .tint(.white)
            }
            .frame(width: 250, height: 250)
            
            Form {
                Section {
                    Text(example.login)
                }
                
                Section {
                    Button("Sign out") {
                        contentVM.isLogged = false
                        contentVM.isSheet = true
                    }
                    .foregroundStyle(.red)
                }
            }
        }
        .background(
            Image("Water")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
    }
}

#Preview {
    ProfileView(contentVM: ContentViewModel())
}
