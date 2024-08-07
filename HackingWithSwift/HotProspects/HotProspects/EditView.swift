//
//  EditView.swift
//  HotProspects
//
//  Created by Thomas Meyer on 07/08/2024.
//

import SwiftData
import SwiftUI

struct EditView: View {
    @Bindable var prospect: Prospect
    
    var body: some View {
        Form {
            TextField("Name", text: $prospect.name)
            
            TextField("Email Address", text: $prospect.emailAddress)
            
            Toggle(isOn: $prospect.isContacted, label: {
                Text("Already contacted ?")
            })
        }
        .navigationTitle("Edit \(prospect.name)")
    }
}

#Preview {
    EditView(prospect: Prospect(name: "John Doe", emailAddress: "johndoe@gmail,com", isContacted: false))
}
