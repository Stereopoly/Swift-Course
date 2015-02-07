//
//  ViewController.swift
//  Managing The Keyboard
//
//  Created by Oscar Bjorkman on 1/7/15.
//  Copyright (c) 2015 Oscar Bjorkman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var textLabel: UILabel!
    
    @IBOutlet var textField: UITextField!
    
    @IBAction func updateButton(sender: AnyObject) {
        textLabel.text = textField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        textLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true
    }


}

