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
    let memoryName = "Évian, une ville de marque"
    let USMBWork = """
Le but était de mettre en avant les enjeux croisés de la marque d'eau minérale evian et de la ville dont elle tire le nom : Évian-les-Bains.
Tout en retraçant brièvement les prémices de la société des eaux.
"""
    
    /* 42 */
    let fourtyTwoCursus = ["Bases du langage C, C++, Python et Django", "Utilisation de Git, Github et Docker"]
    
    
/* ----- MAIN VIEW ----- */
    /*Languages */
    let languages = ["C", "Cpp", "Swift", "Python", "Django"]
    
    /* HardSkills */
    let hardSkills = ["Git", "Github", "Docker"]
    
    /* Projects */
    let projects = ["GuessTheFlag", "TVShowAppV2"]
}
