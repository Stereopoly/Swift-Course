//
//  ViewController.swift
//  Is It Prime
//
//  Created by Oscar Bjorkman on 1/3/15.
//  Copyright (c) 2015 Oscar Bjorkman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var divisible: UILabel!
    
    @IBOutlet var number: UITextField!
    
    @IBAction func prime(sender: AnyObject) {
        
        var userNumber = number.text.toInt()
        
        var arr = [1]      // empty array
        
        if userNumber != nil {
            
            var unwrappedNumber = userNumber!
            
            var isPrime = 1
            
            if unwrappedNumber == 1 {
                isPrime = 0
            }
            if unwrappedNumber == 0 {
                isPrime = 2
            }
            
            if unwrappedNumber != 2 && unwrappedNumber != 1 && unwrappedNumber != 0{
                
                for var i = 2; i < unwrappedNumber; i++ {

                    if unwrappedNumber % i == 0 {
                        
                        println(i)
                        
                        arr.append(i)
                        
                        isPrime = 0
                    }
                    
                }
                
                println(arr)
            }
            
            println(isPrime)
            
            if isPrime == 1 {
                answer.text = "\(unwrappedNumber) is prime"
                number.text = ""
                divisible.text = "Divisible by : 1 and \(unwrappedNumber)"
            }
            if isPrime == 0 {
                arr.append(unwrappedNumber)
                answer.text = "\(unwrappedNumber) is composite"
                number.text = ""
                let stringRep = arr.description
                
                divisible.text = "Divisible by: " + stringRep
            }
            if isPrime == 2 {
                answer.text =  "0 is neither prime nor composite"
                number.text = ""
            }
        }
            
        else {
            answer.text = "Enter a number"
        }
    }
    
    @IBOutlet var answer: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        answer.text = ""
        divisible.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

