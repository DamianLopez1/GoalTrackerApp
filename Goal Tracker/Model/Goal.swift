//
//  Goal.swift
//  Goal Tracker
//
//  Created by Damian Lopez on 1/22/20.
//  Copyright © 2020 Damian Lopez. All rights reserved.
//

import Foundation
import CoreData

extension Goal {
    
    convenience init?(title: String, descriptions: String, goalpicker: String, context: NSManagedObjectContext = Stack.context) {
           
           self.init(context: context)
           
           self.title = title
           self.descriptions = descriptions
        self.goalpicker = goalpicker
    
    }
}
