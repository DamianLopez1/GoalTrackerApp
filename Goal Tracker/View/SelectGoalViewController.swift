//
//  SelectGoalViewController.swift
//  Goal Tracker
//
//  Created by Damian Lopez on 1/21/20.
//  Copyright © 2020 Damian Lopez. All rights reserved.
//

import UIKit

class SelectGoalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let setGoalVC = segue.destination as? SetGoalViewController
        setGoalVC?.loadViewIfNeeded()
        if segue.identifier == "Exercise" {
            setGoalVC?.makeYourOwnTitleLabel.isHidden = true
            setGoalVC?.educationTitleLabel.isHidden = true
            setGoalVC?.financeTitleLabel.isHidden = true
            setGoalVC?.EducationPickerView.isHidden = true
            setGoalVC?.FinancePickerView.isHidden = true
            setGoalVC?.setYourGoalNoPicker.isHidden = true
            setGoalVC?.describeYourGoalNoPicker.isHidden = true
            setGoalVC?.describeYourGoalTextFieldNoPicker.isHidden = true
            setGoalVC?.setYourGoalTextFieldNoPicker.isHidden = true
        }
        if segue.identifier == "Finance" {
            setGoalVC?.makeYourOwnTitleLabel.isHidden = true
            setGoalVC?.educationTitleLabel.isHidden = true
            setGoalVC?.exerciseTitleLabel.isHidden = true
            setGoalVC?.EducationPickerView.isHidden = true
            setGoalVC?.exercisePickerView.isHidden = true
            setGoalVC?.setYourGoalNoPicker.isHidden = true
            setGoalVC?.describeYourGoalNoPicker.isHidden = true
            setGoalVC?.describeYourGoalTextFieldNoPicker.isHidden = true
            setGoalVC?.setYourGoalTextFieldNoPicker.isHidden = true
        }
        if segue.identifier == "Education" {
            setGoalVC?.makeYourOwnTitleLabel.isHidden = true
            setGoalVC?.financeTitleLabel.isHidden = true
            setGoalVC?.exerciseTitleLabel.isHidden = true
            setGoalVC?.FinancePickerView.isHidden = true
            setGoalVC?.exercisePickerView.isHidden = true
            setGoalVC?.setYourGoalNoPicker.isHidden = true
            setGoalVC?.describeYourGoalNoPicker.isHidden = true
            setGoalVC?.describeYourGoalTextFieldNoPicker.isHidden = true
            setGoalVC?.setYourGoalTextFieldNoPicker.isHidden = true
        }
        if segue.identifier == "MakeYourOwn" {
            setGoalVC?.educationTitleLabel.isHidden = true
            setGoalVC?.financeTitleLabel.isHidden = true
            setGoalVC?.exerciseTitleLabel.isHidden = true
            setGoalVC?.EducationPickerView.isHidden = true
            setGoalVC?.exercisePickerView.isHidden = true
            setGoalVC?.FinancePickerView.isHidden = true
            setGoalVC?.setYourGoalTextField.isHidden = true
            setGoalVC?.describeGoalTextView.isHidden = true
            setGoalVC?.describeYourGoalwPicker.isHidden = true
            setGoalVC?.setYourGoalwPicker.isHidden = true
            setGoalVC?.pickYourGoalLabel.isHidden = true
        }
    }

    
}

