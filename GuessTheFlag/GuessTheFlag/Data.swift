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

let Asia = ["Afghanistan", "Armenia", "Azerbaijan", "Bahrain", "Bangladesh", "Bhutan", "Brunei", "Cambodia", "China", "Cyprus", "Georgia", "India", "Indonesia", "Iran", "Iraq", "Israel", "Japan", "Jordan", "Kazakhstan", "Kuwait", "Kyrgyzstan", "Laos", "Lebanon", "Malaysia", "Maldives", "Mongolia", "Myanmar", "Nepal", "North Korea", "Oman", "Pakistan", "Palestine", "Philippines", "Qatar", "Saudi Arabia", "Singapore", "South Korea", "Sri Lanka", "Syria", "Taiwan", "Tajikistan", "Thailand", "Timor-Leste", "Turkey", "Turkmenistan", "United Arab Emirates", "Uzbekistan", "Vietnam", "Yemen"].shuffled()

let America = ["US", "Canada", "Mexico", "Brazil", "Argentina", "Colombia", "Peru", "Venezuela", "Chile", "Ecuador", "Guatemala", "Cuba", "Bolivia", "Dominican Republic", "Honduras", "Paraguay", "El Salvador", "Nicaragua", "Costa Rica", "Puerto Rico", "Panama", "Uruguay", "Jamaica", "Trinidad and Tobago", "Guyana", "Suriname", "Belize", "Bahamas", "Barbados", "Saint Lucia", "Grenada", "Saint Vincent and the Grenadines", "Antigua and Barbuda", "Saint Kitts and Nevis", "Dominica", "Haiti", "Saint Martin", "Sint Maarten", "Aruba", "Curacao", "Bonaire", "Saba", "Sint Eustatius", "Greenland", "Bermuda", "Cayman Islands", "Turks and Caicos Islands", "Anguilla", "British Virgin Islands", "United States Virgin Islands", "Puerto Rico", "Montserrat", "Saint Pierre and Miquelon", "Falkland Islands", "South Georgia and the South Sandwich Islands"].shuffled()

let Oceania = [""].shuffled()
let Africa = [""].shuffled()


/* ------- IMAGE COMPOSITION ------- */
struct ContinentImage: View {
    
    var name: String
    
    var body: some View {
        VStack {
            Text(self.name)
                .font(.subheadline.weight(.heavy))
                .foregroundColor(.white)
            
            Image(self.name)
                .resizable()
                .scaledToFit()
                .clipShape(.rect(cornerRadius: 10))
                .shadow(radius: 5)
        }
    }
}

struct FlagImage: View {
    
    var name: String
    var size: CGFloat
    
    var body: some View {
        Image(self.name)
            .resizable()
            .frame(width: self.size, height: self.size)
            .scaledToFit()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .shadow(radius: 5)
    }
}
