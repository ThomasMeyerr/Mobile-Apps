//
//  ContactDetails.swift
//  MyResume
//
//  Created by Thomas Meyer on 12/06/2024.
//

import SwiftUI

struct ContactDetails: View {
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
                Skills(data: data)
            } label: {
                ContactDetailsLabel(logo: "book.fill", label: "Compétences")
            }
            
            NavigationLink {
                Languages(data: data)
            } label: {
                ContactDetailsLabel(logo: "laptopcomputer", label: "Langages informatiques")
            }
        }
        .navigationTitle("Mes coordonnées")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContactDetails(data: Data())
}
