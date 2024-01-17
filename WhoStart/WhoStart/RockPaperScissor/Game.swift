//
//  Game.swift
//  WhoStart
//
//  Created by Thomas Meyer on 15/01/2024.
//

import SwiftUI

struct Game: View {
    @State private var opacity = 0.0
    @State private var currentIndex = 0
    @State private var loopCount = 0
    @State private var index = 0
    
    var choice = ""
    let images = ["Rock", "Paper", "Scissor"]
    
    var body: some View {
        ZStack {
            VStack {
                Image(images[self.currentIndex])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200, alignment: .center)
                    .opacity(self.opacity)
                    .onAppear {
                        self.animateImageChange()
                    }
                
                Text("VS")
                    .foregroundColor(.secondary)
                    .font(Font.system(size:50, weight: .bold))
                
                Image(choice)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200, alignment: .center)
            }
            if self.loopCount == 5 {
                Result(yours: choice, AI: images[self.currentIndex])
            }
        }
    }
    
    private func animateImageChange() {
        DispatchQueue.main.async {
            withAnimation(.easeIn(duration: 0.5)) {
                self.opacity = 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            withAnimation(.easeOut(duration: 0.5)) {
                self.opacity = 0.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            withAnimation(.easeOut(duration: 0.5)) {
                self.currentIndex = Int.random(in: 0..<self.images.count)
                self.opacity = 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.loopCount += 1
            if self.loopCount < 5 {
                self.animateImageChange()
           }
       }
    }
}
