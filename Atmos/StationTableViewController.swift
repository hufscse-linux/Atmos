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
    var seoul = ["용산구", "광진구", "강남구", "마포구", "종로"]
    var busan = ["부산대"]
    var deagu = ["성수동"]
    var incheon = ["중고차"]
    var gwangjoo = ["몰라"]
    
    var selectLocation : String?
    
    override func viewDidLoad() {

    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if((selectLocation) != nil) {
            switch selectLocation! {
            case "서울":
                return self.seoul.count
            default:
                return 0//self.seoul.count
            }
        }
        return 0//self.seoul.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = self.seoul[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("StationName") as! StationTableCell
        
        cell.stationName.text = row
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let userDefaults = NSUserDefaults()
        let selectedStationName = self.seoul[indexPath.row]
        
        userDefaults.setObject(selectedStationName, forKey: "selectStationName")
        performSegueWithIdentifier("toHome", sender: self)
    }
}
