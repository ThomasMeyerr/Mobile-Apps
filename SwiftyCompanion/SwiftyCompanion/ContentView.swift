//
//  ContentView.swift
//  SwiftyCompanion
//
//  Created by Thomas Meyer on 05/12/2024.
//

import SwiftUI


@MainActor class ContentViewModel: ObservableObject {
    @Published var data = [Data]()
    @Published var isAlert = false
    
    func fetchData() async {
        if let downloadedData: [Data] = await WebService().downloadData(fromUrl: "https://jsonplaceholder.typicode.com/posts") {
            data = downloadedData
        } else {
            isAlert = true
        }
    }
}


struct ContentView: View {
    @StateObject var vm = ContentViewModel()

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
                
                Text("This is the main menu of the app")
                    .foregroundStyle(.gray)
                
//                if !vm.errorString.isEmpty {
//                    Text(vm.errorString)
//                        .foregroundStyle(.red)
//                }
                
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
                Alert(title: Text("Test"))
            }
        }
    }
}

#Preview {
    ContentView()
}
