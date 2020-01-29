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
    
    var goals: [Goal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tempImageView = UIImageView(image: UIImage(named: "Background"))
        tempImageView.frame = self.tableView.frame
        self.tableView.backgroundView = tempImageView
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        goals = GoalController.sharedController.goals
        tableView.reloadData()
    }
    @IBAction func editButton(_ sender: Any) {
        isEditing = !isEditing
    }
    
    
    @IBAction func addButton(_ sender: Any) {
        
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = goals[sourceIndexPath.row]
        goals.remove(at: sourceIndexPath.row)
        goals.insert(itemToMove, at: destinationIndexPath.row)
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           if editingStyle == .delete {
               let goal = GoalController.sharedController.goals[indexPath.row]
            GoalController.sharedController.deleteGoal(goal: goal)
            goals = GoalController.sharedController.goals
               
               tableView.deleteRows(at: [indexPath], with: .fade)
           } else if editingStyle == .insert {
           }
       }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? GoalTableViewCell else {
            return UITableViewCell()
        }
        
        cell.backgroundColor = UIColor.clear
        let goal = goals[indexPath.row]
        cell.goalTextLabel.text = goal.title
        cell.descriptionTextLabel.text = goal.descriptions
        return cell
    }



}

class GoalTableViewCell: UITableViewCell {
    
    @IBOutlet weak var goalTextLabel: UILabel!
    @IBOutlet weak var descriptionTextLabel: UILabel!
    

}

