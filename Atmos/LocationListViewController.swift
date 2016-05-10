//
//  LocationListViewController.swift
//  Atmos
//
//  Created by SunKyu Lee on 5/3/16.
//  Copyright © 2016 SunKyu Lee. All rights reserved.
//

import Foundation
import UIKit

class LocationListViewController: UITableViewController{
    
    var list = ["서울", "부산", "대구", "인천", "광주"]
    
    override func viewDidLoad() {
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let row = self.list[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("LocationCell") as! LocationTableCell
        
        cell.locationName?.text = row
        return cell
    
    }
    
    
    
}