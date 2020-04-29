//
//  CountdownTableViewController.swift
//  Are We There Yet
//
//  Created by Kelson Hartle on 4/28/20.
//  Copyright © 2020 Kelson Hartle. All rights reserved.
//

import UIKit

protocol CountDownTableViewControllerDelegate {
    func countDownAdded()
}

class CountdownTableViewController: UITableViewController {
    
    
    let countdownController = CountdownController()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return countdownController.countdownList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as? CountdownTableViewCell else { fatalError("No") }

        let countdown = countdownController.countdownList[indexPath.row]
        
        cell.countdown = countdown

        return cell
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddEventSegue" {
            
            guard let addEventVC = segue.destination as? DatePickerViewController else { return }
            
            addEventVC.countDownController = countdownController
            
            addEventVC.delegate = self
            
            
        }
        else if segue.identifier == "DetailViewSegue" {
            
            guard let detailVC = segue.destination as? CountownDetailViewController else { return }
                     
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                detailVC.countDownController = countdownController
                detailVC.countdown = countdownController.countdownList[indexPath.row]
                
            }
                
            }
            
        }
    }
    
extension CountdownTableViewController: CountDownTableViewControllerDelegate {
    func countDownAdded() {
        
        tableView.reloadData()
    }
    
    
    
    
    
    
}
