//
//  StackCoreData.swift
//  GuessTheFlag
//
//  Created by Thomas Meyer on 04/02/2024.
//

import SwiftUI
import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "GuessTheFlag")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Error during the init of persistant store: \(error), \(error.userInfo)")
            }
        }
    }
}

class DataManager: ObservableObject {
    // Le contexte de la base de données Core Data
    private let viewContext = PersistenceController.shared.container.viewContext
    static let shared = DataManager()
    
    // Fonction pour ajouter un nouvel utilisateur
    func addUser(username: String, password: String) {
        withAnimation {
            let newUser = User(context: viewContext)
            newUser.username = username
            newUser.password = password
            saveContext()
        }
    }
    
    // Fonction pour récupérer tous les utilisateurs
    func getAllUsers() -> [User] {
        do {
            let users = try viewContext.fetch(User.fetchRequest()) as! [User]
            return users
        } catch {
            print("Erreur lors de la récupération des utilisateurs : \(error.localizedDescription)")
            return []
        }
    }
    
    // Fonction pour mettre à jour les informations d'un utilisateur
    func updateUser(user: User) {
        withAnimation {
            saveContext()
        }
    }
    
    // Fonction pour supprimer un utilisateur
    func deleteUser(user: User) {
        withAnimation {
            viewContext.delete(user)
            saveContext()
        }
    }
    
    // Fonction pour sauvegarder le contexte Core Data
    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            print("Erreur lors de la sauvegarde du contexte : \(error.localizedDescription)")
        }
    }
}
