//
//  GoalsTableViewController.swift
//  Goal Tracker
//
//  Created by Damian Lopez on 1/17/20.
//  Copyright © 2020 Damian Lopez. All rights reserved.
//

import UIKit
import CoreData

class GoalsTableViewController: UITableViewController {
    
     var addedContext: [NSManagedObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let tempImageView = UIImageView(image: UIImage(named: "Background"))
        tempImageView.frame = self.tableView.frame
        self.tableView.backgroundView = tempImageView

    }
    
    @IBAction func addButton(_ sender: Any) {
        
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           if editingStyle == .delete {
               
               guard let appDelegate =
                   UIApplication.shared.delegate as? AppDelegate else {
                       return
               }
               
               let managedContext =
                   appDelegate.persistentContainer.viewContext
               managedContext.delete(addedContext[indexPath.row])
               addedContext.remove(at: indexPath.row)
               tableView.deleteRows(at: [indexPath], with: .fade)
               
               appDelegate.saveContext()
           }
       }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = UIColor.clear

        return cell
    }



}
