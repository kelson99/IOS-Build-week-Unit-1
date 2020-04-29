//
//  Countdown.swift
//  Are We There Yet
//
//  Created by Kelson Hartle on 4/27/20.
//  Copyright © 2020 Kelson Hartle. All rights reserved.
//

import Foundation

struct Countdown {
    
    
    var countDownTitle: String
    var eventNotes: String?
    var date: Date
    
    var dateFormatter: DateFormatter {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "MMM dd, yyyy"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        return dateFormatter
    
    
}
}
