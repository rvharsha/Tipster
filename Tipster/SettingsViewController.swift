//
//  SettingsViewController.swift
//  Tipster
//
//  Created by Harsha Vashisht on 8/26/14.
//  Copyright (c) 2014 Harsha Vashisht. All rights reserved.
//

import UIKit

class SettingsViewController : UIViewController {
    
    @IBOutlet weak var defaultTipPercent: UISlider!
    @IBOutlet weak var defaultPercentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var defaults = NSUserDefaults.standardUserDefaults()
        var percent = defaults.floatForKey("percent") as Float
        defaultPercentLabel.text = String(format: "%2.f", percent * 100)  + "%"
        defaultTipPercent.setValue(percent, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //If the value is changed, store it
    @IBAction func tipPercentValueChanged(sender: AnyObject) {
        var percent = defaultTipPercent.value
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setFloat(percent, forKey: "percent")
        defaults.synchronize()
        defaultPercentLabel.text = String(format: "%2.f", percent * 100)  + "%"
    }
    
}
