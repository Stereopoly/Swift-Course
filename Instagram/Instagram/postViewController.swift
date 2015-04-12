//
//  postViewController.swift
//  Instagram
//
//  Created by Oscar Bjorkman on 3/21/15.
//  Copyright (c) 2015 Oscar Bjorkman. All rights reserved.
//

import UIKit

class postViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var photoSelected:Bool = false
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    @IBOutlet var imageToPost: UIImageView!
    
    @IBAction func logout(sender: AnyObject) {
        
        PFUser.logOut()
        self.performSegueWithIdentifier("logout", sender: self)
        
    }
    
    @IBAction func chooseImage(sender: AnyObject) {
        
        var image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        image.allowsEditing = false
        
        self.presentViewController(image, animated: true, completion: nil)
        
    }
    
    @IBOutlet var shareText: UITextField!
    
    @IBAction func postImage(sender: AnyObject) {
        
        var error = ""
        
        if photoSelected == false {
            
            error = "Please select an image"
            
        }
        else if shareText.text == "" {
            
            error = "Please enter a comment about the photo"
            
        }
        
        if error != "" {
           
            displayAlert("Something is wrong", error: error)
            
        }
        else {
            
            activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 50, 50))
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
            view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()

            
            var post = PFObject(className: "Post")
            post["Title"] = shareText.text
            post["username"] = PFUser.currentUser().username
            
            post.saveInBackgroundWithBlock{(success:Bool!, error: NSError!) -> Void in
            
                if success == false {
                    
                    self.activityIndicator.stopAnimating()
                    UIApplication.sharedApplication().endIgnoringInteractionEvents()
                    
                    self.displayAlert("Something is wrong", error: "Could not post image")
                    
                }
                else {
                    
                    let imageData = UIImagePNGRepresentation(self.imageToPost.image)
                    
                    let imageFile = PFFile(name: "image.png", data: imageData)
                    
                    post["imageFile"] = imageFile
                    
                    post.saveInBackgroundWithBlock{(success:Bool!, error: NSError!) -> Void in
                        
                        if success == false {
                            
                            self.activityIndicator.stopAnimating()
                            UIApplication.sharedApplication().endIgnoringInteractionEvents()
                            
                            self.displayAlert("Something is wrong", error: "Could not post image")
                            
                        }
                        else {
                            
                            self.activityIndicator.stopAnimating()
                            UIApplication.sharedApplication().endIgnoringInteractionEvents()
                            
                            self.displayAlert("Posted!", error: "Your image has been posted succssfully")
                            
                            self.photoSelected = false
                            
                            self.imageToPost.image = UIImage(named: "placeholder.jpg")
                            
                            self.shareText.text = ""
                            
                        }
                    }
                }
                
            }
            
        }
        
    }
    
    func displayAlert(title: String, error: String) {
        
        var alert = UIAlertController(title: title, message: error, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
            
    //        self.dismissViewControllerAnimated(true, completion: nil)
            
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        
        println("Image selected")
        self.dismissViewControllerAnimated(true, completion: nil)
        
        imageToPost.image = image
        
        photoSelected = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        println(PFUser.currentUser())
        
        photoSelected = false
        
        imageToPost.image = UIImage(named: "placeholder.jpg")
        
        shareText.text = ""
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
