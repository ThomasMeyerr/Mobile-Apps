//
//  StackCoreData.swift
//  GuessTheFlag
//
//  Created by Thomas Meyer on 04/02/2024.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "YourAppName")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Erreur lors de l'initialisation du store persistant : \(error), \(error.userInfo)")
            }
        }
    }
}
