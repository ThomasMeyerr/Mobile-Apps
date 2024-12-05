//
//  ContentView.swift
//  SwiftyCompanion
//
//  Created by Thomas Meyer on 05/12/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                Image("42_logo")
                
                Button() {
                    // action
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
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Image("42_background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            )
        }
    }
}

#Preview {
    ContentView()
}
