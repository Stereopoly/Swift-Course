//
//  ViewController.swift
//  Persistant Storage
//
//  Created by Oscar Bjorkman on 1/7/15.
//  Copyright (c) 2015 Oscar Bjorkman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NSUserDefaults.standardUserDefaults().setObject("Oscar", forKey: "myName")
        
        NSUserDefaults.standardUserDefaults().synchronize()    // saves value in earlier line of code
        
        println(NSUserDefaults.standardUserDefaults().objectForKey("myName")!)     // access stored variable
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

