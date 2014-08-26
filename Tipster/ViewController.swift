//
//  ViewController.swift
//  Tipster
//
//  Created by Harsha Vashisht on 8/25/14.
//  Copyright (c) 2014 Harsha Vashisht. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipControlSlider: UISlider!
    @IBOutlet weak var tipPercentLabel: UILabel!
    
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var doublePersonLabel: UILabel!
    @IBOutlet weak var triplePersonLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.0"
        totalLabel.text = "$0.0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Set Default Tip value every time the sc
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        var defaults = NSUserDefaults.standardUserDefaults()
        var percent = defaults.floatForKey("percent") as Float
        tipPercentLabel.text = String(format: "%2.f", percent * 100)  + "%"
        tipControlSlider.setValue(percent, animated: true)
    }

    //Calculate tip on value entered.
    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentage = tipControlSlider.value
        var billAmount = (billField.text as NSString).floatValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        tipLabel.text = "$" + String(format: "%.2f", tip)
        totalLabel.text = "$" + String(format: "%.2f", total)
        tipPercentLabel.text = String(format: "%2.f", tipPercentage * 100)  + "%"
        
        splitLabel.text = "Split"
        doublePersonLabel.text = "웃웃: $" + String(format: "%2.2f", total/2)
        triplePersonLabel.text = "웃웃웃: $" + String(format: "%2.2f", total/3)
    }
    

    //Close keyboard if tapped any where on the screen
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    

}

