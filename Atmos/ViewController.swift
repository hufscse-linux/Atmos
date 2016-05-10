//
//  ViewController.swift
//  Atmos
//
//  Created by SunKyu Lee on 4/28/16.
//  Copyright © 2016 SunKyu Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var sido: UILabel!
    
    @IBOutlet weak var CAI: UILabel!
    
    @IBOutlet weak var CAIgrade: UILabel!
    
    @IBAction func unwindToHome(segue:UIStoryboardSegue) {
        self.getData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /*let userDefaults = NSUserDefaults.standardUserDefaults()
        if let stationName = userDefaults.objectForKey("selectStationName") as? String {
            sido.text = stationName
        }*/
        self.getData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func refresh(sender: AnyObject) {
        self.getData()
    }
    
    func getData() {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if let stationName = userDefaults.objectForKey("selectStationName") as? String {
            sido.text = stationName
            NSLog("----  \(sido.text)")
        } else {
            sido.text = "종로"
            NSLog("Default Station")
        }
        NSLog("--------------")
        let url = NSURL(string: "http://192.168.1.19:3000/")
        
        let apiData : NSData? = NSData(contentsOfURL: url!)
        if let data = apiData {
            //NSLog("%@",NSString(data: data, encoding: NSUTF8StringEncoding)!)
            
            do {
                let apiDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSDictionary
                
                let list = apiDictionary["list"] as! NSArray
                
                for row in list {
                    let Sido = row["stationName"] as! String
                    let caiValue = row["khaiValue"] as! String
                    var caiGrade : Character?
                    if(caiValue != "-") {
                        caiGrade = Character(UnicodeScalar(64+Int(row["khaiGrade"] as! String)!))
                    } else {
                        caiGrade = "-"
                    }
                    
                    if( Sido == sido.text) {
                        sido.text = Sido
                        CAI.text = "\(caiValue)"
                        CAIgrade.text = "\(caiGrade!)"
                    }
                }
                
            } catch {
                
            }
            
        } else {
            NSLog("notgood")
        }
        
    }

}

