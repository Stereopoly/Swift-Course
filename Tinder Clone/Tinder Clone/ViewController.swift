//
//  ViewController.swift
//  Tinder Clone
//
//  Created by Oscar Bjorkman on 5/17/15.
//  Copyright (c) 2015 Oscar Bjorkman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var permissions = ["public_profile"]
        
        PFFacebookUtils.logInInBackgroundWithReadPermissions(permissions, {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                println("User signed up and logged in through Facebook!")
            else if user?.isNew{
                    println("User logged in through Facebook!")
            }
            } else {
                println("Uh oh. The user cancelled the Facebook login.")
            }
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

