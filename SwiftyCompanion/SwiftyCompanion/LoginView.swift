//
//  LoginView.swift
//  SwiftyCompanion
//
//  Created by Thomas Meyer on 23/12/2024.
//

import SwiftUI


@MainActor class LoginViewModel: ObservableObject {
    @Published var isAlert = false
    @Published var alertString = ""
    @ObservedObject var contentVM: ContentViewModel
    
    init(contentVM: ContentViewModel) {
        self.contentVM = contentVM
    }
    
    func fetchData() async {
        let instance = WebService()
        if let downloadedData: [Data] = await instance.downloadData(fromUrl: "https://jsonplaceholder.typicode.com/posts") {
            contentVM.data = downloadedData
            contentVM.isLogged = true
            contentVM.isSheet = false
        } else {
            isAlert = true
            alertString = instance.alertString
        }
    }
}


struct LoginView: View {
    @StateObject var vm: LoginViewModel
    @ObservedObject var contentVM: ContentViewModel
    
    init(contentVM: ContentViewModel) {
        self._contentVM = ObservedObject(wrappedValue: contentVM)
        self._vm = StateObject(wrappedValue: LoginViewModel(contentVM: contentVM))
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                Image("42_logo")
                
                Button() {
                    Task {
                        await vm.fetchData()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(red: 0/255, green: 188/255, blue: 154/255))
                            .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.1)
                        
                        Text("SIGN IN")
                            .foregroundStyle(.white)
                            .bold()
                            .font(.title)
                    }
                }
                .padding()
                
                Text("Swifty Companion")
                    .foregroundStyle(.gray)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Image("42_background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            )
            .alert(isPresented: $vm.isAlert) {
                Alert(title: Text(vm.alertString))
            }
        }
    }
}

#Preview {
    LoginView(contentVM: ContentViewModel())
}
