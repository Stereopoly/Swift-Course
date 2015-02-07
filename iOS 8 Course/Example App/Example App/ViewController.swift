//
//  ViewController.swift
//  Example App
//
//  Created by Oscar Bjorkman on 1/1/15.
//  Copyright (c) 2015 Oscar Bjorkman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myLabel: UILabel!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        myLabel.text = "It Worked"   // does this once button is pressed
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        println("Hello World")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

