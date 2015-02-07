//
//  ViewController.swift
//  What's The Weather
//
//  Created by Rob Percival on 25/09/2014.
//  Copyright (c) 2014 Appfish. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var city: UITextField!
     @IBOutlet var result: UILabel!
    
    @IBAction func getWeather(sender: AnyObject) {
        
        println("Button Pressed")
        
        self.resignFirstResponder()
        
        var urlString = "http://www.weather-forecast.com/locations/" + city.text.stringByReplacingOccurrencesOfString(" ", withString: "") + "/forecasts/latest"
        
        var url = NSURL(string: urlString)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {
            (data, response, error) in
            
            var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding)
            
            if urlContent!.containsString("<span class=\"phrase\">") {
                
                var contentArray = urlContent!.componentsSeparatedByString("<span class=\"phrase\">")
                
                var newContentArray = contentArray[1].componentsSeparatedByString("</span>")
                
                var weatherForcast = newContentArray[0].stringByReplacingOccurrencesOfString("&deg;", withString: "º")
                
                dispatch_async(dispatch_get_main_queue()) {
                    
                    self.result.text = weatherForcast
                    
                }
                
                
                
            } else {
                
                
                dispatch_async(dispatch_get_main_queue()) {
                    
                    self.result.text = "Could not find that city - please try again"
                }
                
                
                
            }
            
            
        }
        
        task.resume()
        
        
    }
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

