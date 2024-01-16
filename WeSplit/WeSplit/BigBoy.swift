//
//  BigBoy.swift
//  WeSplit
//
//  Created by Thomas Meyer on 11/01/2024.
//

import SwiftUI

struct BigBoy: View {
    @State private var size: CGFloat = 30
    var body: some View
    {
        Image (systemName: "globe")
            .resizable()
            .frame(width: self.size, height: self.size)
            .onTapGesture {
                self.size += 20
            }
            .animation(.easeOut)
            .onChange(of: self.size) {
                self.check()
            }
    }
    
    func check() {
        if self.size >= UIScreen.main.bounds.width || self.size >= UIScreen.main.bounds.height {
            self.size = 30
        }
    }
}

#Preview {
    BigBoy()
}
