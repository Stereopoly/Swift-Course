//
//  ViewController.swift
//  Images
//
//  Created by Rob Percival on 04/07/2014.
//  Copyright (c) 2014 Appfish. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
                            
    @IBOutlet var alien : UIImageView!
    
    var counter = 1;
    
    
    @IBAction func buttonPressed(sender : AnyObject) {
        
        counter++
        
        if (counter==6) {
            counter = 1
        }
        
        alien.image = UIImage(named: "frame\(counter).png")
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
        
    }
    
    func result() {
         counter++
        
        if (counter==6) {
            counter = 1
        }
        
        alien.image = UIImage(named: "frame\(counter).png")

        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    override func viewDidLayoutSubviews() {
        
        alien.frame = CGRectMake(100, 20, 0, 0)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        UIView.animateWithDuration(1, animations: {
            
        self.alien.frame = CGRectMake(100, 20, 100, 200)
            
            })
        
    }
    
    
}

