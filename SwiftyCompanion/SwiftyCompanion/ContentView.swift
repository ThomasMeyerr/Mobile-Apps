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
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.1)
                            .foregroundStyle(Color(red: 0, green: 188, blue: 154))
                            .clipShape(.rect(cornerRadius: 10))
                            .padding()
                        
                        Text("SIGN IN")
                            .foregroundStyle(.white)
                            .bold()
                            .font(.title)
                    }
                }
                .padding()
                
                Spacer()
            }
            .background(Image("42_background").scaledToFit())
        }
    }
}

#Preview {
    ContentView()
}
