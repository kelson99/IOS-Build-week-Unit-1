//
//  DatePickerViewController.swift
//  Are We There Yet
//
//  Created by Kelson Hartle on 4/27/20.
//  Copyright © 2020 Kelson Hartle. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func eventDateWasChosen(date: Date)
    
    
}


class DatePickerViewController: UIViewController {
    
    
    @IBOutlet weak var countdownDatePicker: UIDatePicker!
    @IBOutlet weak var countDownTitleTextField: UITextField!
    @IBOutlet weak var notesTextField: UITextView!
    
    var countDownController = CountdownController()
    
    var delegate: CountDownTableViewControllerDelegate?
    
    var dateDelegate: DatePickerDelegate?
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        
        guard let countdownTitle = countDownTitleTextField.text, let notesTextField = notesTextField.text else { return }
        
        countDownController.createNewCountdown(title: countdownTitle, eventNotes: notesTextField)
        
        delegate?.countDownAdded()
        dateDelegate?.eventDateWasChosen(date: countdownDatePicker.date)
        
        dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
