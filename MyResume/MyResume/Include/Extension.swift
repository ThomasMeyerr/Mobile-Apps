//
//  Extension.swift
//  MyResume
//
//  Created by Thomas Meyer on 18/07/2024.
//

import SwiftUI

struct DarkModeToolbarModifier: ViewModifier {
    @Binding var isDarkMode: Bool
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem {
                    Button {
                        isDarkMode.toggle()
                    } label: {
                        Image(systemName: isDarkMode ? "sun.min.fill" : "moon.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35)
                            .foregroundStyle(isDarkMode ? .white : .black)
                    }
                }
            }
            .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}
