//
//  ContentView.swift
//  Flashzilla
//
//  Created by Thomas Meyer on 08/08/2024.
//

import SwiftUI

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(y: offset * 10)
    }
}

struct ContentView: View {
    @State private var cards = Array<Card>(repeating: .example, count: 10)
    
    var body: some View {
        CardView(card: .example)
    }
}

#Preview {
    ContentView()
}
