//
//  Data.swift
//  MyResume
//
//  Created by Thomas Meyer on 12/06/2024.
//

import Foundation

@Observable
class Data {
    var isDarkMode = true
    
    let name = "Thomas Meyer"
    let email = "thomasmeyercontact@gmail.com"
    let dateOfBirth = "13 novembre 1993"
    let phone = "06 25 62 64 24"
    let address = """
79 Rue du canal des usiniers
73000 Chambéry
"""
    let drivingLicense = "B - Véhiculé"
    
    let softSkills = ["Travail en équipe", "Polyvalence", "Autonomie", "Rigueur"]
    
    let languages = ["C", "Cpp", "Swift", "Python", "Django"]
    let hardSkills = ["Git", "Github", "Docker"]
}
