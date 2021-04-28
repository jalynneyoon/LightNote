//
//  DataManager.swift
//  LightNote
//
//  Created by Johyeon Yoon on 2021/04/28.
//

import Foundation
import CoreData

class DataManager {
    static let shared = DataManager()
    private init() {
        
    }
    
    var mainContext : NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    var noteList = [Note]()
    
    func fetchNote(){
        let request : NSFetchRequest<Note> = Note.fetchRequest()
        
        let sortedByDate = NSSortDescriptor(key: "insertDate", ascending: false)
        request.sortDescriptors = [sortedByDate]
        
        do {
            noteList = try mainContext.fetch(request)
        } catch {
            print(error)
        }
    }
    
    func addNewNote(_ note: String?){
        let newNote = Note(context: mainContext)
        
        newNote.content = note
        newNote.insertDate = Date()
        
        noteList.insert(newNote, at: 0)
        
        saveContext()
        
    }
    
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}