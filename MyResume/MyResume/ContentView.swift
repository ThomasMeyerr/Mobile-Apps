//
//  ContentView.swift
//  MyResume
//
//  Created by Thomas Meyer on 12/06/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var data = Data()

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    NavigationLink {
                        ContactDetails(data: data)
                    } label: {
                        HStack(spacing: 20) {
                            Image("Moi")
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .frame(width: 80)
                            
                            VStack(alignment: .leading) {
                                Text(data.name)
                                    .font(.title2)
                                Text("Développeur iOS (Stagiaire)")
                                    .font(.subheadline)
                            }
                        }
                    }
                }
            }
            .navigationTitle("C.V.")
            .toolbar {
                ToolbarItem {
                    Button {
                        data.isDarkMode.toggle()
                    } label: {
                        Image(systemName: data.isDarkMode ? "sun.min.fill" : "moon.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35)
                            .foregroundStyle(data.isDarkMode ? .white : .black)
                    }
                }
            }
            .preferredColorScheme(data.isDarkMode ? .dark : .light)
        }
    }
}

#Preview {
    ContentView()
}
