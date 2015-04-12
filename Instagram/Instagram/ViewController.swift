//
//  ViewController.swift
//  Instagram
//
//  Created by Oscar Bjorkman on 3/17/15.
//  Copyright (c) 2015 Oscar Bjorkman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var signupActive = true
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    func displayAlert(title: String, error: String) {
        
        var alert = UIAlertController(title: title, message: error, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
            
      //      self.dismissViewControllerAnimated(true, completion: nil)
            
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    @IBOutlet var username: UITextField!
   
    @IBOutlet var password: UITextField!
    
    @IBOutlet var signUpLabel: UILabel!
    
    @IBOutlet var welcomeMessageLabel: UILabel!
    
    @IBOutlet var signUpButton: UIButton!
    
    @IBOutlet var loginLabel: UIButton!
    
    @IBOutlet var registeredLabel: UILabel!
    
    @IBAction func loginButton(sender: AnyObject) {
        
        if signupActive == true {
            
            signupActive = false
            signUpLabel.text = "Login"
            signUpButton.setTitle("Login", forState: UIControlState.Normal)
            registeredLabel.text = "Not Registered?"
            loginLabel.setTitle("Sign Up", forState: UIControlState.Normal)
            welcomeMessageLabel.text = "Welcome Back!"
            
        }
        else {
            
            signupActive = true
            signUpLabel.text = "Sign Up for Instagram"
            signUpButton.setTitle("Sign Up  ", forState: UIControlState.Normal)
            registeredLabel.text = "Already registered?"
            loginLabel.setTitle("Login", forState: UIControlState.Normal)
            welcomeMessageLabel.text = "Welcome!"
        }
        
    }
    
    
    @IBAction func signUp(sender: AnyObject) {
        
        var error = ""
        var pass = countElements(password.text)
        
        if signupActive == true {
        
            if username.text != "" {
                if password.text != "" {
                    if pass < 6 {
                    error = "Please enter a longer password"
                    }
                }
                else {
                    error = "Please enter your desired password"
                }
            }
            else {
                error = "Please enter your desired username"
            }
        
        }
        else {
            
            if username.text == "" && password.text == "" {
                
                error = "Please enter your username and password"
                
            }
            else if username.text == ""{
                
                error = "Please enter your username"
                
            }
            else if password.text == "" {
                
                error = "Please enter your password"
                
            }
            
        }
        
        
        if error != "" {
            
            displayAlert("Something is wrong", error: error)
            
        } else {
            
            activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 50, 50))
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
            view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()
            
            if signupActive == true {
                
                var user = PFUser()
                user.username = username.text
                user.password = password.text
            
                user.signUpInBackgroundWithBlock {(succeeded: Bool!, signupError: NSError!) -> Void in
                
                    self.activityIndicator.stopAnimating()
                    UIApplication.sharedApplication().endIgnoringInteractionEvents()
                    
                    if signupError == nil {
                    
                        println("signed up")
                        
                        self.displayAlert("Signed Up!", error: "Go ahead and login")
                        
                        
                    }
                    else {
                        if let errorString = signupError.userInfo?["error"] as? NSString {
                        
                            error = errorString
                        
                        }
                
                        self.displayAlert("Could Not Sign Up", error: error)
                
                    }
                
                }
                
            }
            else {
                
                PFUser.logInWithUsernameInBackground(username.text, password:password.text) {
                    (user: PFUser!, signupError: NSError!) -> Void in
                    if signupError == nil {
                        
                        self.activityIndicator.stopAnimating()
                        UIApplication.sharedApplication().endIgnoringInteractionEvents()
                        
                        println("logged in")
                        
                        self.performSegueWithIdentifier("jumpToUserTable", sender: self)
                        
                    }
                    else {
                        
                        if let errorString = signupError.userInfo?["error"] as? NSString {
                            
                            error = errorString
                            
                        }
                        
                        self.activityIndicator.stopAnimating()
                        UIApplication.sharedApplication().endIgnoringInteractionEvents()
                        
                        self.displayAlert("Could Not Log In", error: error)
                        
                    }
                }
                
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        println(PFUser.currentUser())
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        if PFUser.currentUser() != nil {
            
            self.performSegueWithIdentifier("jumpToUserTable", sender: self)
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.navigationController?.navigationBarHidden = true
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        self.navigationController?.navigationBarHidden = false
        
    }


}






