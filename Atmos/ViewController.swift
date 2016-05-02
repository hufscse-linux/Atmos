//
//  ViewController.swift
//  Atmos
//
//  Created by SunKyu Lee on 4/28/16.
//  Copyright © 2016 SunKyu Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.getData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getData() {
        let url = NSURL(string: "http://192.168.1.8:3000/")
        
        let apiData : NSData? = NSData(contentsOfURL: url!)
        if let data = apiData {
            NSLog("%@",NSString(data: data, encoding: NSUTF8StringEncoding)!)
        } else {
            NSLog("notgood")
        }
        
    }

}

