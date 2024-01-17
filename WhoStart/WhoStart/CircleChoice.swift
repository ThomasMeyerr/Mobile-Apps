//
//  CircleChoice.swift
//  WhoStart
//
//  Created by Thomas Meyer on 11/01/2024.
//

import SwiftUI

struct CircleChoice: View {
    
    @State private var shapes: [AnyView] = []
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.black)
                .ignoresSafeArea()
            
            ForEach(shapes.indices, id: \.self) {
                shapes[$0]
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            shapes.append(AnyView(
            Circle()
                .fill(Color.red)
                .frame(width: 100, height: 100)
            ))
        }
    }
}

#Preview {
    CircleChoice()
}
