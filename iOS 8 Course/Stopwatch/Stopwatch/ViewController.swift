//
//  ViewController.swift
//  Stopwatch
//
//  Created by Oscar Bjorkman on 1/6/15.
//  Copyright (c) 2015 Oscar Bjorkman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var time = 0;
    var timer = NSTimer()

    @IBOutlet var timeLabel: UILabel!
    
    @IBAction func startButton(sender: AnyObject) {
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
        
        println("Start button pressed")
        
    }
    
    @IBAction func stopButton(sender: AnyObject) {
        
        timer.invalidate()
        
        println("Stop button pressed")
        
    }
    
    @IBAction func resetButton(sender: AnyObject) {
        timer.invalidate()
        time = 0
        timeLabel.text = "0"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        time = 0;
        timeLabel.text = "0"
        
    }
    
    func result() {
        println("1 second passed")
        
        time++;

        timeLabel.text = "\(time)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

