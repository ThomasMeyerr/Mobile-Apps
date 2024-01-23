//
//  Data.swift
//  GuessTheFlag
//
//  Created by Thomas Meyer on 19/01/2024.
//

import SwiftUI

/* ------- LIST OF CONTINENTS ------- */
let continents = [
    "Europe": Europe,
    "Asia": Asia,
    "America": America,
    "Oceania": Oceania,
    "Africa": Africa
]


/* ------- LIST OF COUNTRIES ------- */
let Europe = ["Estonia", "France", "Germany", "Ireland", "Italy", "Poland", "Spain", "UK", "Ukraine", "Montenegro", "Albania", "Netherlands", "Austria", "North Macedonia", "Belgium", "Norway", "Bosnia and Herzegovina", "Portugal", "Bulgaria", "Romania", "Croatia", "Russia", "Czech Republic", "Serbia", "Denmark", "Slovakia", "Finland", "Slovenia", "Greece", "Sweden", "Hungary", "Switzerland", "Kosovo", "Monaco", "Andorra", "Armenia", "Azerbaijan", "Belarus", "Cyprus", "Georgia", "Iceland", "Kazakhstan", "Latvia", "Liechtenstein", "Lithuania", "Malta", "San Marino", "Turkey", "Vatican City"].shuffled()
let Asia = [String]()
let America = [String]()
let Oceania = [String]()
let Africa = [String]()


/* ------- IMAGE COMPOSITION ------- */
struct ContinentImage: View {
    
    var name: String
    
    var body: some View {
        VStack {
            Text(name)
                .font(.subheadline.weight(.heavy))
                .foregroundColor(.white)
            
            Image(name)
                .resizable()
                .scaledToFit()
                .clipShape(.rect(cornerRadius: 10))
                .shadow(radius: 5)
        }
    }
}

struct HorizontaleImage: View {
    
    var name: String
    
    var body: some View {
        Image(name)
            .resizable()
            .frame(width: 150, height: 150)
            .scaledToFit()
            .clipShape(.circle)
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .shadow(radius: 5)
    }
}

struct VerticaleImage: View {
    
    var name: String
    
    var body: some View {
        Image(name)
            .resizable()
            .frame(width: 180, height: 180)
            .scaledToFit()
            .clipShape(.circle)
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .shadow(radius: 5)
    }
}
