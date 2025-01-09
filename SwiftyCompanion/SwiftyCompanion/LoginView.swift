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
    
    func connnectVia42() {
        let instance = WebService()
        let oauthURL = "https://api.intra.42.fr/oauth/authorize?client_id=\(instance.clientID)&redirect_uri=\(instance.encodedRedirectUri)&response_type=code"
        
        if let url = URL(string: oauthURL) {
            UIApplication.shared.open(url)
        }
    }
    
    func manageCallback(url: URL) async {
        if let queryItems = URLComponents(string: url.absoluteString)?.queryItems {
            if let code = queryItems.first(where: { $0.name == "code" })?.value {
                let cleanCode = code.trimmingCharacters(in: .whitespacesAndNewlines)
                await fetchData(code: cleanCode)
            } else if let error = queryItems.first(where: { $0.name == "error" })?.value {
                alertString = "\(error)"
                isAlert = true
            }
        }
    }
    
    func fetchData(code: String) async {
        let instance = WebService()
        if let downloadedData: User = await instance.downloadData(fromUrl: "https://api.intra.42.fr/v2/me", code: code) {
            contentVM.user = downloadedData
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
                    vm.connnectVia42()
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
            .onOpenURL { url in
                Task {
                    await vm.manageCallback(url: url)
                }
            }
        }
    }
}

#Preview {
    LoginView(contentVM: ContentViewModel())
}
