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
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTime), userInfo: nil, repeats: true)
        
    }
    
    @objc func UpdateTime() {
        
        let userCalendar = Calendar.current
        let date = Date()
        //Look into changing this function here
        let components = userCalendar.dateComponents([.hour,.minute,.month,.year,.day,.second], from: date)
        let currentDate = userCalendar.date(from: components)
        
        var eventDateComponents = DateComponents()
        eventDateComponents.year = 2021
        eventDateComponents.month = 01
        eventDateComponents.day = 01
        eventDateComponents.hour = 00
        eventDateComponents.minute = 00
        eventDateComponents.second = 00
        eventDateComponents.timeZone = TimeZone(abbreviation: "GMT")
        
        let eventDate = userCalendar.date(from: eventDateComponents)!
        
        let timeLeft = userCalendar.dateComponents([.day,.hour,.minute,.second], from: currentDate!, to: eventDate)
        
        counterNumberLabel.text = "\(timeLeft.day!) days \n \(timeLeft.hour!) hours \n \(timeLeft.minute!) minutes \n \(timeLeft.second!) seconds"
        
        endEvent(currentdate: currentDate!, eventdate: eventDate)
    }
    
    func endEvent(currentdate: Date, eventdate: Date) {
        
        if currentdate >= eventdate {
            
            counterNumberLabel.text = "WE ARE THERE"
            
            timer?.invalidate()
            
        }
        
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
        
        
        
    }
    
    
        
}


