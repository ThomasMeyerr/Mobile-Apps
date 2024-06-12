//
//  ContactDetails.swift
//  MyResume
//
//  Created by Thomas Meyer on 12/06/2024.
//

import SwiftUI

struct ContactDetails: View {
    @Bindable var data: Data

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
                .opacity(0.6)
        }
        
        Form {
            NavigationLink {
                //
            } label: {
                HStack(spacing: 20) {
                    Logo(logo: "person.text.rectangle.fill")
                    
                    Text("Infos personnelles")
                }
            }
        }
        .navigationTitle("Mes coordonnées")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContactDetails(data: Data())
}
