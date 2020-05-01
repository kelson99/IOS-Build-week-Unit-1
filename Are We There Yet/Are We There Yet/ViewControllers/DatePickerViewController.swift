//
//  DatePickerViewController.swift
//  Are We There Yet
//
//  Created by Kelson Hartle on 4/27/20.
//  Copyright © 2020 Kelson Hartle. All rights reserved.
//

import UIKit


class DatePickerViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var countdownDatePicker: UIDatePicker!
    @IBOutlet weak var countDownTitleTextField: UITextField!
    @IBOutlet weak var notesTextField: UITextView!
    
    // MARK: - Properties
    
    var countDownController = CountdownController()
    var delegate: CountDownTableViewControllerDelegate?
    
    //MARK: - Life Cycle Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - Functions
    
    func hideKeyBoard() {
        
        countDownTitleTextField.resignFirstResponder()
        
    }
    
    // MARK: - Actions
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        
        guard let countdownTitle = countDownTitleTextField.text, let notesTextField = notesTextField.text else { return }
        let date = countdownDatePicker.date
        
        countDownController.createNewCountdown(title: countdownTitle, eventNotes: notesTextField, date: date)
        
        delegate?.countDownAdded()
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
    
}
