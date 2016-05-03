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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        let url = NSURL(string: "http://192.168.0.49:3000/")
        
        let apiData : NSData? = NSData(contentsOfURL: url!)
        if let data = apiData {
            //NSLog("%@",NSString(data: data, encoding: NSUTF8StringEncoding)!)
            
            do {
                let apiDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSDictionary
                
                let list = apiDictionary["list"] as! NSArray
                
                for row in list {
                    let Sido = row["stationName"] as! String
                    let caiGrade = row["khaiGrade"] as! String
                    let atmosGrade = row["pm25Grade"] as! String

                    if( Sido == "종로") {
                        sido.text = Sido
                        CAI.text = "CAI 수치 : \(caiGrade)"
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

