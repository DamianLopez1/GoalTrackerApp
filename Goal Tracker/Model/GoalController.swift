//
//  GoalController.swift
//  Goal Tracker
//
//  Created by Damian Lopez on 1/22/20.
//  Copyright © 2020 Damian Lopez. All rights reserved.
//

import Foundation
import CoreData

class GoalController {
    
    static let sharedController = GoalController()
    
           var goals: [Goal] {
               let request: NSFetchRequest<Goal> = Goal.fetchRequest()
               
               do {
                   return try Stack.context.fetch(request).sorted(by: { $0.title ?? "" < $1.title ?? "" } )
               } catch {
                   return []
               }
           }
           
    func addGoal(title1: String, descriptions1: String, goalpicker1: String) {
               let _ = Goal(title: title1, descriptions: descriptions1, goalpicker: goalpicker1)
               save()
               
           }
           
           func deleteGoal(goal: Goal) {
               Stack.context.delete(goal)
               save()
           }
       //        this is used for adding deleting and editing
           func save() {
               Stack.saveContext()
           }
}
