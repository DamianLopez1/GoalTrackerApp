//
//  Progress.swift
//  Goal Tracker
//
//  Created by Maximo Crupi on 3/3/20.
//  Copyright © 2020 Damian Lopez. All rights reserved.
//

import Foundation
import CoreData

extension Progress {
    
    convenience init?(percentageLabel: String, descriptions: String, goalpicker: String, context: NSManagedObjectContext = Stack.context) {
           
           self.init(context: context)
           
           self.title = title
           self.descriptions = descriptions
//        self.goalpicker = goalpicker
    
    }
}
