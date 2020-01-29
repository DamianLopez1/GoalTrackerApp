//
//  SetGoalViewController.swift
//  Goal Tracker
//
//  Created by Damian Lopez on 1/21/20.
//  Copyright © 2020 Damian Lopez. All rights reserved.
//

import UIKit

class SetGoalViewController: UIViewController {
    
    @IBOutlet weak var describeGoalTextView: UITextView!
    @IBOutlet weak var setYourGoalTextField: UITextField!
    @IBOutlet weak var exercisePickerView: UIPickerView!
    @IBOutlet weak var EducationPickerView: UIPickerView!
    @IBOutlet weak var FinancePickerView: UIPickerView!
    @IBOutlet weak var exerciseTitleLabel: UILabel!
    @IBOutlet weak var educationTitleLabel: UILabel!
    @IBOutlet weak var financeTitleLabel: UILabel!
    @IBOutlet weak var makeYourOwnTitleLabel: UILabel!
    @IBOutlet weak var pickYourGoalLabel: UILabel!
    @IBOutlet weak var setYourGoalwPicker: UILabel!
    @IBOutlet weak var describeYourGoalwPicker: UILabel!
    @IBOutlet weak var describeYourGoalNoPicker: UILabel!
    @IBOutlet weak var setYourGoalNoPicker: UILabel!
    @IBOutlet weak var describeYourGoalTextFieldNoPicker: UITextView!
    @IBOutlet weak var setYourGoalTextFieldNoPicker: UITextField!
    
    var exercise = ExerciseData()
    var education = EducationData()
    var finance = FinanceData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting border and color for both Text Boxes
        describeGoalTextView!.layer.borderWidth = 1
        describeGoalTextView!.layer.borderColor = UIColor.black.cgColor
        describeGoalTextView.layer.cornerRadius = 15
        describeYourGoalTextFieldNoPicker!.layer.borderWidth = 1
        describeYourGoalTextFieldNoPicker!.layer.borderColor = UIColor.black.cgColor
        describeYourGoalTextFieldNoPicker.layer.cornerRadius = 15
        setYourGoalTextField!.layer.borderColor = UIColor.black.cgColor
        setYourGoalTextField!.layer.borderWidth = 1
        setYourGoalTextField.layer.cornerRadius = 4
        setYourGoalTextFieldNoPicker!.layer.borderColor = UIColor.black.cgColor
        setYourGoalTextFieldNoPicker!.layer.borderWidth = 1
        setYourGoalTextFieldNoPicker.layer.cornerRadius = 4
        
        
        //updating the pickers to display the data
        exercisePickerView.delegate = exercise
        exercisePickerView.dataSource = exercise
        EducationPickerView.delegate = education
        EducationPickerView.dataSource = education
        FinancePickerView.delegate = finance
        FinancePickerView.dataSource = finance
        updateView()
    }
    @IBAction func goalTextChanged(_ sender: UITextField) {
        if exerciseTitleLabel.isHidden == false {
        setAmountExerciseChosen(to: sender.text ?? "")
        exercisePickerView.reloadAllComponents()
    }
        if educationTitleLabel.isHidden == false {
            setAmountEducationChosen(to: sender.text ?? "")
            EducationPickerView.reloadAllComponents()
        }
        if financeTitleLabel.isHidden == false {
            setAmountFinanceChosen(to: sender.text ?? "")
            FinancePickerView.reloadAllComponents()
        }
    }
    //Updating Titles
    func updateView() {
        financeTitleLabel.text = "Finance"
        exerciseTitleLabel.text = "Exercise"
        educationTitleLabel.text = "Education"
        
    }
    
    func setAmountExerciseChosen(to newAmount: String) {
        ExerciseData.amountChosen = newAmount
    }
    func setAmountEducationChosen(to newAmount: String) {
        EducationData.amountChosen = newAmount
    }
    func setAmountFinanceChosen(to newAmount: String) {
        FinanceData.amountChosen = newAmount
    }
    
    //Finish button to add a goal and close view controller
    @IBAction func finishButtonTapped(_ sender: Any) {
        
        if exerciseTitleLabel.isHidden == false {
            let selectedExercisePickerRow = exercisePickerView.selectedRow(inComponent: 0)
            let exerciseValue = ExerciseData.exerciseData[selectedExercisePickerRow]
            
            guard let _ = setYourGoalTextField.text, let goalpicker = describeGoalTextView.text else {
                return
            }
            GoalController.sharedController.addGoal(title1: exerciseValue, descriptions1: describeGoalTextView.text, goalpicker1: goalpicker)
            setAmountExerciseChosen(to: "__")
            navigationController?.popToRootViewController(animated: true)
        }
        
        if setYourGoalNoPicker.isHidden == false {
            
            guard let title2 = setYourGoalTextFieldNoPicker.text, let goalpicker3 = describeYourGoalTextFieldNoPicker.text else {
                return
            }
            
            GoalController.sharedController.addGoal(title1: title2, descriptions1: goalpicker3, goalpicker1: goalpicker3)
            setAmountExerciseChosen(to: "__")
            navigationController?.popToRootViewController(animated: true)
            
        }
        
        if educationTitleLabel.isHidden == false {
            let selectedEducationPickerRow = EducationPickerView.selectedRow(inComponent: 0)
            let educationValue = EducationData.educationData[selectedEducationPickerRow]
            
            guard let _ = setYourGoalTextField.text, let goalpicker = describeGoalTextView.text else {
                return
            }
            GoalController.sharedController.addGoal(title1: educationValue, descriptions1: describeGoalTextView.text, goalpicker1: goalpicker)
            
            navigationController?.popToRootViewController(animated: true)
        }
        
        if financeTitleLabel.isHidden == false {
            let selectedFinancePickerRow = FinancePickerView.selectedRow(inComponent: 0)
            let financeValue = FinanceData.financeData[selectedFinancePickerRow]
            
            guard let _ = setYourGoalTextField.text, let goalpicker = describeGoalTextView.text else {
                return
            }
            GoalController.sharedController.addGoal(title1: financeValue, descriptions1: describeGoalTextView.text, goalpicker1: goalpicker)
            setAmountFinanceChosen(to: "__")
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
}
//First extension for exercise data added to picker
class ExerciseData: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    static var amountChosen: String = "__"
    
    static var exerciseData: [String] {
        return ["I want to workout \(amountChosen) times this week",
            "I want to workout for \(amountChosen) hours this week",
            "I want to run \(amountChosen) miles this week"]
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ExerciseData.exerciseData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ExerciseData.exerciseData[row]
    }
    
    
}
//Second extension for education data added to picker
class EducationData: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    static var amountChosen: String = "__"
    
    static var educationData: [String] {
       return ["I want to study \(amountChosen) hours this week",
    "I want to get \(amountChosen) percent on my test this week",
    "I want to complete \(amountChosen) assignments this week"]
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        EducationData.educationData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return EducationData.educationData[row]
    }
    
}
//third exxtension for finance data added to picker
class FinanceData: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    static var amountChosen: String = "__"
    static var financeData: [String] {
        return ["I want to save $\(amountChosen) this week",
                        "I want to make $\(amountChosen) this week",
                        "I only want to spend $\(amountChosen) this week"]
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        FinanceData.financeData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return FinanceData.financeData[row]
    }
    
    
}
