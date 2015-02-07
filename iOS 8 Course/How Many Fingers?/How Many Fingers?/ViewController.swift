//
//  ViewController.swift
//  How Many Fingers?
//
//  Created by Oscar Bjorkman on 1/2/15.
//  Copyright (c) 2015 Oscar Bjorkman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var endGame: UILabel!
    
    @IBOutlet var guessTextField: UITextField!
    
    @IBAction func startButton(sender: AnyObject) {
        
        var randomInt = arc4random_uniform(6);
        
        instructionsLabel.text = "Enter Your Guess"
        guessTextField.hidden = false;
        
        var userAnswer = guessTextField.text.toInt()
        
        println(randomInt)
        if userAnswer != nil {
            userAnswer = guessTextField.text.toInt()
            if userAnswer == Int(randomInt) {
                endGame.text = "You are correct!"
            }
            else {
                endGame.text = "Sorry you are incorrect. It was \(randomInt)"
            }
        }
        
    }
    
    @IBOutlet var instructionsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        instructionsLabel.text = "";
        guessTextField.hidden = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

