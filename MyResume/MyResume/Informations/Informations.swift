//
//  Informations.swift
//  MyResume
//
//  Created by Thomas Meyer on 12/06/2024.
//

import SwiftUI

struct Informations: View {
    var data: Data

    var body: some View {
        VStack {
            Image("Moi")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 150)
            
            Text(data.name)
                .font(.largeTitle)
            
            Text(data.email)
                .opacity(0.5)
        }
        
        Form {
            NavigationLink {
                PersonalInfo(data: data)
            } label: {
                ContactDetailsLabel(logo: "person.text.rectangle.fill", label: "Infos personnelles")
            }
            
            NavigationLink {
                SoftSkills(data: data)
            } label: {
                ContactDetailsLabel(logo: "book.fill", label: "Soft skills")
            }
            
            NavigationLink {
                SchoolCurriculum(data: data)
            } label: {
                ContactDetailsLabel(logo: "graduationcap.fill", label: "Parcours scolaire")
            }
            
            NavigationLink {
                Hobbies(data: data)
            } label: {
                ContactDetailsLabel(logo: "figure.open.water.swim", label: "Centres d'intérêt")
            }
        }
        .navigationTitle("Informations globales")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    Informations(data: Data())
}
