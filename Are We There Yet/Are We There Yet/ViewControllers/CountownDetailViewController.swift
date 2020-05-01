//
//  CountownDetailViewController.swift
//  Are We There Yet
//
//  Created by Kelson Hartle on 4/27/20.
//  Copyright © 2020 Kelson Hartle. All rights reserved.
//

import UIKit

class CountownDetailViewController: UIViewController {
    
    
    
    @IBOutlet weak var countdownTitleLabel: UILabel!
    @IBOutlet weak var counterNumberLabel: UILabel!
    @IBOutlet weak var notes: UITextView!
    
    var timer: Timer?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        

    }
    
    
    
    
    

    @objc func UpdateTime(date: Date) -> Date {
        
        let timeLeftover = timeLeft(date: date)

        return timeLeftover.date ?? Date()
    }
    
    // timeleft function takes in a date and returns a datecomponents
    
    private func timeLeft(date: Date) -> DateComponents {
        
        let userCalendar = Calendar.current
        //Look into changing this function here
        let components = userCalendar.dateComponents([.hour,.minute,.month,.year,.day,.second], from: Date())
        let currentDate = userCalendar.date(from: components)
        

        let timeLeft = userCalendar.dateComponents([.day,.hour,.minute,.second], from: currentDate!, to: date)
        
        return timeLeft
        
    }

    func endEvent(eventdate: Date) {

        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true, block: { (timer) in
            
            let currentdate = self.UpdateTime(date: eventdate)
            
            if currentdate >= eventdate {

                self.counterNumberLabel.text = "YOU MADE IT!"

                timer.invalidate()

            } else {
                
                let timeLeftover = self.timeLeft(date: eventdate)
                
                
                self.counterNumberLabel.text = "\(timeLeftover.day!) days \n \(timeLeftover.hour!) hours \n \(timeLeftover.minute!) minutes \n \(timeLeftover.second!) seconds"
            }
        })
        
        

    }
    
    
    var countDownController: CountdownController?
    
    var countdown: Countdown? {
        
        didSet {
            
        updateViews()
            
        }
        
    }
    
    
    
    
    func updateViews() {
        
        guard isViewLoaded else { return }
        
        guard let countdown = countdown else { return }
        
        countdownTitleLabel.text = countdown.countDownTitle
        notes.text = countdown.eventNotes
        counterNumberLabel.text = countdown.dateFormatter.string(from: countdown.date)
        
        endEvent(eventdate: countdown.date)
        
        
        
    }
    
    
        
}


