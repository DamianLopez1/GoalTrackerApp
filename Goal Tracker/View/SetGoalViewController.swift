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
    
    var exercise = ExerciseData()
    var education = EducationData()
    var finance = FinanceData()
    
    override func viewDidLoad() {
        exercisePickerView.delegate = exercise
        EducationPickerView.delegate = education
        FinancePickerView.delegate = finance
        super.viewDidLoad()
        //Setting border and color for both Text Boxes
        describeGoalTextView!.layer.borderWidth = 1
        describeGoalTextView!.layer.borderColor = UIColor.black.cgColor
        describeGoalTextView.layer.cornerRadius = 15
        setYourGoalTextField!.layer.borderColor = UIColor.black.cgColor
        setYourGoalTextField!.layer.borderWidth = 1
        setYourGoalTextField.layer.cornerRadius = 4
    }
}

class ExerciseData: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    var exerciseData = ["I want to workout ____ times this week",
    "I want to workout for ____ hours this week",
    "I want to run ____ miles this week"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return exerciseData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return exerciseData[row]
    }
    
    
}
class EducationData: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    var educationData = ["I want to study ____ hours this week",
    "I want to get ____ percent on my test this week",
    "I want to complete ____ assignments this week"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        educationData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return educationData[row]
    }
    
    
    
}
class FinanceData: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    var financeData =  ["I want to save $____ this week",
                        "I want to make $____ this week",
                        "I only want to spend $____ this week"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        financeData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return financeData[row]
    }
    
    
}
