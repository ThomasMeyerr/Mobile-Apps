//
//  ProfileView.swift
//  SwiftyCompanion
//
//  Created by Thomas Meyer on 23/12/2024.
//

import SwiftUI


@MainActor class ProfileViewModel: ObservableObject {
    @Published var isAlert = false
    @Published var user: User
    @ObservedObject var contentVM: ContentViewModel
    
    init(contentVM: ContentViewModel) {
        self.contentVM = contentVM
        self.user = contentVM.user ?? User(id: 1, email: "omg@gmail.com", login: "thmeyer", firstName: "Thomas", lastName: "Meyer", kind: "student", image: UserImage(link: "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"), correctionPoint: 31, location: nil, wallet: 1064, active: true)
    }
}


struct ProfileView: View {
    @ObservedObject var contentVM: ContentViewModel
    @StateObject var vm: ProfileViewModel
    
    init(contentVM: ContentViewModel) {
        self._contentVM = ObservedObject(wrappedValue: contentVM)
        self._vm = StateObject(wrappedValue: ProfileViewModel(contentVM: contentVM))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    AsyncImage(url: URL(string: vm.user.image.link)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                    } placeholder: {
                        ProgressView()
                            .scaleEffect(5)
                    }
                    .frame(width: 250, height: 250)
                    
                    Image(systemName: vm.user.active ?? false ? "checkmark.seal.fill" : "xmark.seal.fill")
                        .font(.system(size: 50))
                        .foregroundStyle(vm.user.active ?? false ? .green : .red)
                        .background(
                            Circle()
                                .fill(.background)
                                .frame(width: 60, height: 60)
                        )
                }
                
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.secondary.opacity(0.8))
                            .frame(width: 250, height: 100)
                        
                        VStack {
                            HStack {
                                Text("₳ \(vm.user.wallet)")
                                    .font(.title)
                                Text(vm.user.login)
                                    .font(.title2.bold())
                            }
                            .foregroundStyle(.white)
                            
                            HStack {
                                Text(vm.user.firstName)
                                Text(vm.user.lastName)
                            }
                            .foregroundStyle(.secondary)
                        }
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.secondary.opacity(0.8))
                            .frame(width: 100, height: 100)
                        
                        Text("\(vm.user.correctionPoint)")
                            .font(.title)
                            .foregroundStyle(.white)
                    }
                }
                
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(style: StrokeStyle())
                        .frame(width: 360, height: 30)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.green)
                        .frame(width: 180, height: 28)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        vm.isAlert = true
                    } label: {
                        Image(systemName: "power")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                            .tint(.red)
                    }
                }
            }
        }
        .alert("Log out?", isPresented: $vm.isAlert) {
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
