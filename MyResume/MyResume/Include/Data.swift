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
    
    /* ExperiencePro */
    let jobName = ["Vendeur polyvalent", "Stagiaire - Chargé de mission", "Téléconseiller immobilier"]
    let jobPlace = ["Bio C'Bon - Aix-les-Bains", "CAUE de la Savoie - Chambéry", "Scorimmo - Les Sables-d'Olonne"]
    let jobDate = [
    """
    Février 2016 - août 2016
    Mars 2017
    Juillet 2017 - Décembre 2017
    """,
    "Janvier 2018 - Juillet 2018",
    "Octobre 2020 - Juillet 2021"
    ]
    let jobDescription = [
    """
    Connaissances des DLC/DLUO, gestion des stocks, suivi du magasin, des règles d’hygiène alimentaire, ouverture et fermeture du magasin, caisse
    Management d’une équipe de 4 personnes
    """,
    """
    Mettre au point une méthodologie d’inventaire des chalets d’alpage à destination des communes, et écrire un document de vulgarisation à destination du public
    Participation à la Commission des Sites en charge des permis de construire relatif aux bâtis d’alpage
    """,
    """
    Renseigner les clients sur les caractéristiques d’un bien immobilier
    Assurer le suivi des erreurs informatiques rencontrés par les équipes et les transmettre au service informatique
    """]
    
    /* Projects */
    let projects = ["GuessTheFlag", "TVShowAppV2"]
}
