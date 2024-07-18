//
//  Extension.swift
//  MyResume
//
//  Created by Thomas Meyer on 18/07/2024.
//

import SwiftUI

struct DarkModeToolbarModifier: ViewModifier {
    @State var data = Data()
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem {
                    Button {
                        data.isDarkMode.toggle()
                    } label: {
                        Image(systemName: data.isDarkMode ? "sun.min.fill" : "moon.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35)
                            .foregroundStyle(data.isDarkMode ? .white : .black)
                    }
                }
            }
            .preferredColorScheme(data.isDarkMode ? .dark : .light)
    }
}
