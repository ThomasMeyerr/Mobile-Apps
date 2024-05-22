//
//  User.swift
//  GuessTheFlag
//
//  Created by Thomas Meyer on 30/01/2024.
//

import SwiftUI

struct UserView: View {
    @State private var username = String()
    @State private var password = String()

    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(red: 52/255, green: 103/255, blue: 51/255), .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Spacer()

                TitleText(title: "Max Score : \(UserDefaults.standard.integer(forKey: "MaxScore"))")
    
                Spacer()
                
                TitleText(title: "Login or sign up")
                
                TextField("Username", text: self.$username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Password", text: self.$password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Spacer()
                
                HStack(spacing: 100) {
                    Button("Login") {
                        //
                    }
                    
                    Button("Sign Up") {
                        //
                    }
                }
                
                Spacer()
            }
            .background {
                Color.white
                    .blur(radius: 400)
            }
            .cornerRadius(10)
            .padding()
        }
    }
}

#Preview {
    UserView()
}
