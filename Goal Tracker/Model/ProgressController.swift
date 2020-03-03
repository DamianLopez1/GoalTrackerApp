//
//  ProgressController.swift
//  Goal Tracker
//
//  Created by Maximo Crupi on 3/3/20.
//  Copyright © 2020 Damian Lopez. All rights reserved.
//
//
//import Foundation
//import CoreData
//
//class ProgressController {
//    
//    static let sharedController = ProgressController()
//    
//           var progress1: [Progress] {
//               let request: NSFetchRequest<Progress> = Progress.fetchRequest()
//               
//               do {
//                return try ProgressStack.context.fetch(request).sorted(by: { $0.percentageLabel ?? 0 < $1.self.percentageLabel ?? 0 } )
//               } catch {
//                   return []
//               }
//           }
//           
//    func addProgress(percentageLabel1: Int16) {
//        let _ = Progress(percentageLabel: percentageLabel1)
//               save()
//               
//           }
//
//           func save() {
//               ProgressStack.saveContext()
//           }
//}
