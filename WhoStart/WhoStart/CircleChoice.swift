//
//  CircleChoice.swift
//  WhoStart
//
//  Created by Thomas Meyer on 11/01/2024.
//

import SwiftUI

struct CircleModel: Identifiable {
    var id = UUID()
    var x: CGFloat
    var y: CGFloat
}

struct CircleChoice: View {
    
    @State private var circles: [CircleModel] = []

    var body: some View {
        ZStack {
            Rectangle()
                .background(Color.black.ignoresSafeArea())
                .onTapGesture { location in
                    print("X = \(location.x) and Y = \(location.y)")
                    let newCircle = CircleModel(x: location.x, y: location.y)
                    circles.append(newCircle)
                }
            
            ForEach(circles) { circle in
                Circle()
                    .fill(Color.red)
                    .frame(width: 100, height: 100)
                    .position(x: circle.x, y: circle.y)
            }
        }
    }
}

#Preview {
    CircleChoice()
}
