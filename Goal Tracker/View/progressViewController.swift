//
//  progressViewController.swift
//  Goal Tracker
//
//  Created by Maximo Crupi on 2/25/20.
//  Copyright © 2020 Damian Lopez. All rights reserved.
//

import UIKit

class progressViewController: UIViewController {
    
    var goalName = ""
    var goalAmount = 0
    var goalsTableViewController = GoalsTableViewController()
    var subGoalName = [0...1000]
    
    func seperate() -> Int {
        
         let goalSeperator = goalName.split(separator: " ")
        for item in goalSeperator {
            let part = item.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
            
            if let intVal = Int(part) {
                print("this is a number -> \(intVal)")
                return intVal
            }
            
        }
        return 0
    }
    
    //SET TOTAL UNIT COUNT TO EQUAL chosenAmount (Their goal Number)
    var progress = Progress(totalUnitCount: 1)

    
    
    // Outlets
    

    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var treeGoalLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var growButton: UIButton!

    // Actions
    
    func changeImage() {
        if progressBar.progress < 0.125 {
            treeImageView.image = UIImage(named:"Tree1")
        } else if progressBar.progress >= 0.125 && progressBar.progress < 0.25 {
            treeImageView.image = UIImage(named:"Tree2")
        } else if progressBar.progress >= 0.25 && progressBar.progress < 0.375 {
            treeImageView.image = UIImage(named: "Tree3")
        } else if progressBar.progress >= 0.375 && progressBar.progress < 0.5 {
            treeImageView.image = UIImage(named: "Tree4")
        } else if progressBar.progress >= 0.5 && progressBar.progress < 0.625 {
            treeImageView.image = UIImage(named: "Tree5")
        } else if progressBar.progress >= 0.625 && progressBar.progress < 0.75 {
            treeImageView.image = UIImage(named: "Tree6")
        } else if progressBar.progress >= 0.75 && progressBar.progress < 0.875 {
            treeImageView.image = UIImage(named: "Tree7")
        } else if progressBar.progress >= 0.875 && progressBar.progress < 1 {
            treeImageView.image = UIImage(named: "Tree8")
        } else {
            treeImageView.image = UIImage(named: "medal")
        }
    }
        
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func growButtonTapped(_ sender: UIButton) {
         
            self.progress.completedUnitCount += 1
            self.progressBar.setProgress(Float(self.progress.fractionCompleted), animated: true)

            self.percentageLabel.text = "\(Int(self.progress.fractionCompleted * 100)) %"
        
        seperate()
       
        changeImage()
 
        }
    
    //breakButton()
 /*   func breakButton() {
        if goalProgressLabel.text == String?("100%") {
            growButton.isEnabled = false
        }
    }*/
    
//    @IBAction func goalProgressPressed(_ sender: UIStepper) {
//        goalProgressLabel.text = String(Int(sender.value))
//    }
    
    
    // ViewDidLoad
    
    
    override func viewDidLoad() {
        progress = Progress(totalUnitCount: Int64(seperate()))
        super.viewDidLoad()
        treeGoalLabel.text = goalName
        
        
        
        
    }
    
}
