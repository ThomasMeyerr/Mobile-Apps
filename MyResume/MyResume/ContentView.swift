//
//  ContentView.swift
//  MyResume
//
//  Created by Thomas Meyer on 12/06/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isDarkMode = false

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    HStack(spacing: 20) {
                        Image("Moi")
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(width: 100)
                        
                        VStack {
                            Text("Thomas Meyer")
                                .font(.title)
                            Text("Développeur iOS (Stagiaire")
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationTitle("Mon C.V.")
            .toolbar {
                ToolbarItem {
                    Button {
                        isDarkMode.toggle()
                    } label: {
                        Image(systemName: isDarkMode ? "sun.min.fill" : "moon.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35)
                            .foregroundStyle(isDarkMode ? .white : .black)
                    }
                }
            }
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}

#Preview {
    ContentView()
}
