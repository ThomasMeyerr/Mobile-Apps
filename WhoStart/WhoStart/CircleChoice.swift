//
//  CircleChoice.swift
//  WhoStart
//
//  Created by Thomas Meyer on 11/01/2024.
//

import SwiftUI

struct Point: Hashable {
    var x: CGFloat
    var y: CGFloat
}

struct CircleChoice: View {
    @State private var touchLocations: [Point] = []

    var body: some View {
        ZStack {
            ForEach(touchLocations, id: \.self) { location in
                Image(systemName: "star.fill") // Remplacez par l'image de votre choix
                    .foregroundColor(.blue) // Couleur de l'image
                    .frame(width: 50, height: 50) // Taille de l'image
                    .position(x: location.x, y: location.y)
            }
        }
        .gesture(
            DragGesture(minimumDistance: 0, coordinateSpace: .local)
                .onChanged { value in
                    let touchLocation = value.location
                    let point = Point(x: touchLocation.x, y: touchLocation.y)
                    touchLocations.append(point)
                }
        )
    }
}

#Preview {
    CircleChoice()
}
