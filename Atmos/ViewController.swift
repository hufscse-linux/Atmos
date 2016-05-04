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
        }
        NSLog("--------------")
        let url = NSURL(string: "http://10.100.69.62:3000/")
        
        let apiData : NSData? = NSData(contentsOfURL: url!)
        if let data = apiData {
            //NSLog("%@",NSString(data: data, encoding: NSUTF8StringEncoding)!)
            
            do {
                let apiDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSDictionary
                
                let list = apiDictionary["list"] as! NSArray
                
                for row in list {
                    let Sido = row["stationName"] as! String
                    let caiValue = row["khaiValue"] as! String
                    //let caiGrade = Character(UnicodeScalar(64+Int(row["khaiGrade"] as! String)!))
                    let caiGrade = row["khaiGrade"] as! String
                    //let atmosGrade = row["pm25Grade"] as! String

                    if( Sido == sido.text) {
                        sido.text = Sido
                        CAI.text = "\(caiValue)"
                        CAIgrade.text = "\(caiGrade)"
                        //let test = Int(CAIgrade.text!)
                        //let test2 = Character(UnicodeScalar(64+test!))
                        //CAIgrade.text = "\(test2)"
                    }
                    //NSLog("---------")
                }
                
            } catch {
                
            }
            
        } else {
            NSLog("notgood")
        }
        
    }

}

