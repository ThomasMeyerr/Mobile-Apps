//
//  LoadingScreen.swift
//  TVShowAppV2
//
//  Created by Thomas Meyer on 25/02/2024.
//

import SwiftUI

struct LoadingScreen: View {
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            
            VStack() {
                Spacer()
                Spacer()
                
                Image("Logo")
                
                Spacer()
                
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(5)
                
                Spacer()
                Spacer()
            }
        }
    }
}
