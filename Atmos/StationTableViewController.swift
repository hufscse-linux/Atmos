//
//  StationTableViewController.swift
//  Atmos
//
//  Created by SunKyu Lee on 5/3/16.
//  Copyright © 2016 SunKyu Lee. All rights reserved.
//

import Foundation

import UIKit

class StationTableViewController: UITableViewController {
    var list = ["용산구", "광진구", "강남구", "마포구", "종로"]
    override func viewDidLoad() {
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = self.list[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("StationName") as! StationTableCell
        
        cell.stationName.text = row
        
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let userDefaults = NSUserDefaults()
        let selectedStationName = self.list[indexPath.row]
        
        userDefaults.setObject(selectedStationName, forKey: "selectStationName")
    }
    
    @IBAction func unwindToHome(sender : UIStoryboardSegue) {
        
    }
}
