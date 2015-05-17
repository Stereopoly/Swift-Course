//
//  ViewController.swift
//  Minimal
//
//  Created by Oscar Bjorkman on 5/16/15.
//  Copyright (c) 2015 Oscar Bjorkman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var windowOpen:Bool = false

    @IBAction func buttonMid(sender: AnyObject) {
        println("wake up")
        button1.setTitle("go outside", forState: UIControlState.Normal)
        button2.setTitle("open windows", forState: UIControlState.Normal)
        button1.hidden = false
        button2.hidden = false
        buttonMid.hidden = true
        message1.text = "you wake up in a broken down shack"
        
        
    }
    @IBOutlet var buttonMid: UIButton!
    
    @IBAction func button1(sender: AnyObject) {
        if button1.titleLabel!.text == "go inside" {
            println("go inside 1")
            
            if windowOpen == true {
                 button2.setTitle("close windows", forState: UIControlState.Normal)
            } else {
                 button2.setTitle("open windows", forState: UIControlState.Normal)
            }
            
            message1.text = ""
            
            let delay = 1 * Double(NSEC_PER_SEC)
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(time, dispatch_get_main_queue()) {
                self.message1.text = "you go inside"
            }
            button1.setTitle("go outside", forState: UIControlState.Normal)
        }
        if button1.titleLabel!.text == "go outside" {
            println("go outside 1")
            
            button2.setTitle("walk towards the swamp", forState: UIControlState.Normal)
            
            message1.text = ""
            
            let delay = 1 * Double(NSEC_PER_SEC)
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(time, dispatch_get_main_queue()) {
                self.message1.text = "you go outside"
            }
            button1.setTitle("go inside", forState: UIControlState.Normal)
        }
        if button1.titleLabel!.text == "walk back home" {
            println("walk back home 1")
            
            button2.setTitle("walk towards the swamp", forState: UIControlState.Normal)
            
            message1.text = ""
            
            let delay = 1 * Double(NSEC_PER_SEC)
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(time, dispatch_get_main_queue()) {
                self.message1.text = "you walk back"
            }
            button1.setTitle("go outside", forState: UIControlState.Normal)
        }
        if button1.titleLabel!.text == "open windows" {
            println("open windows 1")
            
            windowOpen = true
            
            button2.setTitle("close windows", forState: UIControlState.Normal)
            
            message1.text = ""
            
            let delay = 1 * Double(NSEC_PER_SEC)
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(time, dispatch_get_main_queue()) {
                self.message1.text = "you open the windows"
            }
            button1.setTitle("go outside", forState: UIControlState.Normal)
        }
        
    }
    @IBOutlet var button1: UIButton!
    
    @IBAction func button2(sender: AnyObject) {
        if buttonMid.titleLabel!.text == "wake up" {
            println("wake up mid")
            
            message1.text = ""
            
            let delay = 1 * Double(NSEC_PER_SEC)
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(time, dispatch_get_main_queue()) {
                self.message1.text = "you go outside"
            }
            
            button1.setTitle("go inside", forState: UIControlState.Normal)
            button2.setTitle("walk towards the swamp", forState: UIControlState.Normal)
            
        }
        if button2.titleLabel!.text == "walk towards the swamp" {
            println("walk towards the swamp 2")
            
            message1.text = ""
            
            let delay = 1 * Double(NSEC_PER_SEC)
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(time, dispatch_get_main_queue()) {
                self.message1.text = "you walk towards the swamp"
            }
            
            button1.setTitle("walk back home", forState: UIControlState.Normal)
            button2.setTitle("collect some reeds", forState: UIControlState.Normal)
            
        }
        if button2.titleLabel!.text == "close windows" {
            println("close windows 2")
            
            windowOpen = false
            
            message1.text = ""
            
            let delay = 1 * Double(NSEC_PER_SEC)
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(time, dispatch_get_main_queue()) {
                self.message1.text = "you close the windows"
            }
            let time2 = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(time, dispatch_get_main_queue()) {
                self.message1.text = "it gets dark inside"
            }
            
            button1.setTitle("go outside", forState: UIControlState.Normal)
            button2.setTitle("open windows", forState: UIControlState.Normal)
            
        }
        if button2.titleLabel!.text == "open windows" {
            println("open windows 2")
            
            windowOpen = true
            
            message1.text = ""
            
            let delay = 1 * Double(NSEC_PER_SEC)
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(time, dispatch_get_main_queue()) {
                self.message1.text = "you open the windows"
            }
            let time2 = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(time, dispatch_get_main_queue()) {
                self.message1.text = "the sunlight illuminates the room"
            }
            
            button1.setTitle("go outside", forState: UIControlState.Normal)
            button2.setTitle("close windows", forState: UIControlState.Normal)
            
        }

    }
    @IBOutlet var button2: UIButton!
    
    
    @IBOutlet var message1: UILabel!
    
    @IBOutlet var message2: UILabel!
    
    @IBOutlet var message3: UILabel!
    
    @IBOutlet var message4: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        resetMessages()
        buttonMid.setTitle("wake up", forState: UIControlState.Normal)
        button1.hidden = true
        button2.hidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func resetMessages() {
        message1.text = ""
        message2.text = ""
        message3.text = ""
        message4.text = ""
    }


}

