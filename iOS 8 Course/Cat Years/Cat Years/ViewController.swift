//
//  ViewController.swift
//  Cat Years
//
//  Created by Oscar Bjorkman on 1/1/15.
//  Copyright (c) 2015 Oscar Bjorkman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func calculateButton(sender: AnyObject) {
        
        
        var enteredAge = age.text.toInt()
        
        if enteredAge != nil {      // making sure user actualy enters into text field (not empty, which causes crash)
            
            var catYears = enteredAge! * 7    // exclamation point unwraps the variable aka tells xcode that this variable is guaranteed to be an integer as stated earlier
            
            resultLabel.text = "Your cat is: \(catYears) in cat years"
        
        }
        else {       // tell user nothing has been entered by changing label
            resultLabel.text = "Nothing entered"
        }
    }
    
    @IBOutlet var age: UITextField!
    
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        resultLabel.text = ""

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

