//
//  CountdownController.swift
//  Are We There Yet
//
//  Created by Kelson Hartle on 4/27/20.
//  Copyright © 2020 Kelson Hartle. All rights reserved.
//

import Foundation


class CountdownController {
    
    // MARK: - Properties

    //Data source for the table view
    var countdownList: [Countdown] = []
    
    // MARK: - Functions
    
    @discardableResult func createNewCountdown(title: String, eventNotes: String?, date: Date) -> Countdown {
        
        let newCountdown = Countdown(countDownTitle: title, eventNotes: eventNotes, date: date )
        
        countdownList.append(newCountdown)
        
        return newCountdown
        
    }
}
