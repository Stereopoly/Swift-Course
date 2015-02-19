//
//  ViewController.swift
//  Core Data Demo
//
//  Created by Oscar Bjorkman on 2/19/15.
//  Copyright (c) 2015 Oscar Bjorkman. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var appDel:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        
//        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) as NSManagedObject
//        
//        newUser.setValue("Tom", forKey: "username")    // modifying attributes of the new user
//        
//        newUser.setValue("pass3", forKey: "password")
//        
//        context.save(nil)
        
        var request = NSFetchRequest(entityName: "Users")    // fetch data with entity name Users
        
        request.returnsObjectsAsFaults = false
        
        request.predicate = NSPredicate(format: "username = %@", "Osk")        // how to search for a certain username
        
        var results = context.executeFetchRequest(request, error: nil)
        
   //     println(results)
        
        if results?.count > 0 {
            
            println(results)
        
            for result:AnyObject in results! {
                
                if let user = result.valueForKey("username") as? String {     // Only goes through if there is a value
                    
                    if user == "Osk" {
                        
                     //   context.deleteObject(result as NSManagedObject)
                     //   println(user + " has been deleted")
                       
                        result.setValue("pass6", forKey: "password")          // Change an attribute
                        
                    }
                    
                }
               context.save(nil)
            }
        
        }
        else {
            println("No results")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

