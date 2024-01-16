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
                    .foregroundColor(.white)
                    .font(Font.system(size:50, weight: .bold))
                
                Image(choice)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200, alignment: .center)
            }
            if self.loopCount == 3 {
                Result(yours: choice, AI: images[self.currentIndex])
            }
        }
    }
    
    private func animateImageChange() {
        DispatchQueue.main.async {
            withAnimation(.easeIn(duration: 1.0)) {
                self.opacity = 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeOut(duration: 1.0)) {
                self.opacity = 0.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(.easeOut(duration: 1.0)) {
                self.currentIndex = Int.random(in: 0..<self.images.count)
                self.opacity = 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
           self.loopCount += 1
           if self.loopCount < 3 {
               self.animateImageChange()
           }
       }
    }
}
