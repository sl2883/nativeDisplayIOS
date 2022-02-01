//
//  ViewController.swift
//  NativeDisplayIOS
//
//  Created by Sunny Ladkani on 1/31/22.
//

import UIKit
import CleverTapSDK

class ViewController: UIViewController, CleverTapDisplayUnitDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        CleverTap.sharedInstance()?.setDisplayUnitDelegate(self)
    }

    @IBAction func event1Trigger(sender: UIButton) {
        print("Event 1 Trigger");
        
        let props: Dictionary<String, Any> = [
            "Product name": "Casio Chronograph Watch",
            "Category": "Mens Accessories",
            "Price": 59.99,
            "Date": NSDate()
        ]

        CleverTap.sharedInstance()?.recordEvent("Event1Trigger", withProps: props)
    }
    
    @IBAction func event2Trigger(sender: UIButton) {
        print("Event 2 Trigger");
        
        let props: Dictionary<String, Any> = [
            "Product name": "Casio Chronograph Watch",
            "Category": "Mens Accessories",
            "Price": 59.99,
            "Date": NSDate()
        ]

        CleverTap.sharedInstance()?.recordEvent("Event2Trigger", withProps: props)
    }
    
    func displayUnitsUpdated(_ displayUnits: [CleverTapDisplayUnit]) {
        let units:[CleverTapDisplayUnit] = displayUnits;
        var unitCount  = 1
        for unit in displayUnits {
            let contents = unit.contents
            var json = unit.json
            
            var contentIterator = contents?.makeIterator()
            while let content = contentIterator?.next() {
                let title = content.title
                let mediaURL = content.mediaUrl
                
                print(title)
                print(mediaURL)
            }
           
//            print(contents)
//            print(json)
            
        }
    }
}

