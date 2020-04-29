//
//  CountdownTableViewCell.swift
//  Are We There Yet
//
//  Created by Kelson Hartle on 4/28/20.
//  Copyright © 2020 Kelson Hartle. All rights reserved.
//

import UIKit


class CountdownTableViewCell: UITableViewCell {

    @IBOutlet weak var countdownTitle: UILabel!

    var countdown: Countdown? {
        
        didSet {
            
            updateViews()
            
        }
    }

    
    func updateViews() {
        
        countdownTitle.text = countdown?.countDownTitle
        
    }
    
}
