//
//  ProgressStack.swift
//  Goal Tracker
//
//  Created by Maximo Crupi on 3/3/20.
//  Copyright © 2020 Damian Lopez. All rights reserved.
//

//import Foundation
//import CoreData
//
//struct ProgressStack {
//    
//    
//    static let persistentContainer: NSPersistentContainer = {
//        
//        let container = NSPersistentContainer(name: "Goal_Tracker")
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError? {
//                
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
//        return container
//    }()
//    
//    
//    
//    
//    static var context: NSManagedObjectContext { return persistentContainer.viewContext }
//    
//    
//    
//    
//    
//    static func saveContext () {
//        let context = ProgressStack.context
//        
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//                
//                let nserror = error as NSError
//                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//            }
//        }
//    }
//    
//}

