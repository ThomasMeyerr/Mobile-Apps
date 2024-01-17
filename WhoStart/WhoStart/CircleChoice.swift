//
//  CircleChoice.swift
//  WhoStart
//
//  Created by Thomas Meyer on 11/01/2024.
//

import SwiftUI

struct CircleChoice: View {

    @GestureState private var isLongPress = false
    @State private var pressEnd = false
    
    var longPress: some Gesture {
        LongPressGesture(minimumDuration: 3)
            .updating(self.$isLongPress) { currentState, gestureState, transaction in
                gestureState = currentState
                transaction.animation = Animation.easeIn(duration: 2.0)
            }
            .onEnded { finished in
                self.pressEnd = finished
            }
    }

    var body: some View {
        Circle()
            .fill(self.isLongPress ?
                  Color.red :
                    (self.isLongPress ? Color.green : Color.blue))
            .frame(width: 100, height: 100, alignment: .center)
            .gesture(longPress)
    }
}

#Preview {
    CircleChoice()
}
