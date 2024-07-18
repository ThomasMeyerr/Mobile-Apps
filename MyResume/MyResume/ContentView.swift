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
                        Informations(data: data)
                    } label: {
                        HStack(spacing: 15) {
                            Image("Moi")
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .frame(width: 80)
                            
                            VStack(alignment: .leading) {
                                Text(data.name)
                                    .font(.title2)
                                Text("""
Développeur iOS (Stagiaire)
Octobre 2024
""")
                                    .font(.subheadline)
                            }
                        }
                    }
                }
                
                Section("Compétences") {
                    NavigationLink {
                        HardSkills(data: data)
                    } label: {
                        ContactDetailsLabel(logo: "keyboard.fill", label: "Hard skills")
                    }
                    
                    NavigationLink {
                        Languages(data: data)
                    } label: {
                        ContactDetailsLabel(logo: "laptopcomputer", label: "Langages informatiques")
                    }
                }
                
                Section {
                    NavigationLink {
                        ExperiencePro(data: data)
                    } label: {
                        ContactDetailsLabel(logo: "briefcase.fill", label: "Expériences profesionnelles")
                    }
                }
                
                Section("Projets") {
                    Projects(data: data)
                }
            }
            .navigationTitle("C.V.")
            .modifier(DarkModeToolbarModifier())
        }
    }
}

#Preview {
    ContentView()
}
