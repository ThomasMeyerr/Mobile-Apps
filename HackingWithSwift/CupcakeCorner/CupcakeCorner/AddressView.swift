//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Thomas Meyer on 10/06/2024.
//

import SwiftUI

struct AddressView: View {
    var order: Order

    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                
            }
        }
    }
}

#Preview {
    AddressView(order: Order())
}
