//
//  Data.swift
//  MyResume
//
//  Created by Thomas Meyer on 12/06/2024.
//

import Foundation

class Data {
    var isDarkMode = true
    
    
/* ----- INFORMATIONS ----- */
    /* PersonalInfo */
    let name = "Thomas Meyer"
    let email = "thomasmeyercontact@gmail.com"
    let dateOfBirth = "13 novembre 1993"
    let phone = "06 25 62 64 24"
    let address = """
79 Rue du canal des usiniers
73000 Chambéry
"""
    let drivingLicense = "B - Véhiculé"
    
    /* SoftSkills */
    let softSkills = ["Travail en équipe", "Polyvalence", "Autonomie", "Rigueur"]
    
    /* Hobbies */
    let hobbies = ["Informatique", "Histoire", "Musique", "Arts", "Cinéma"]
    
    
/* ----- SCHOOLS ----- */
    /* USMB */
    let USMBCursus = """
Licence Histoire                    2011 - 2014
Master Métiers du Patrimoine    2016 - 2018
"""
    
    /* 42 */
    let fourtyTwoCursus = ["Bases du langage C, C++, Python et Django", "Utilisation de Git, Github et Docker"]
    
    
/* ----- CONTENT VIEW ----- */
    let languages = ["C", "Cpp", "Swift", "Python", "Django"]
    let hardSkills = ["Git", "Github", "Docker"]
}
