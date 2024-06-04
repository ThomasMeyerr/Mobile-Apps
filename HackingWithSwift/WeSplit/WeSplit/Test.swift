//
//  Test.swift
//  WeSplit
//
//  Created by Thomas Meyer on 11/01/2024.
//

import SwiftUI

struct Test: View {
    @State private var text = ""
    
    var body: some View {
        Form {
            TextField("Enter your name", text: self.$text)
            Text("Thanks to \(self.text) to be in this world")
        }
    }
}

#Preview {
    Test()
}
