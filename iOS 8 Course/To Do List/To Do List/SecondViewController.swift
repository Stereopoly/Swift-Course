//
//  SecondViewController.swift
//  To Do List
//
//  Created by Oscar Bjorkman on 1/7/15.
//  Copyright (c) 2015 Oscar Bjorkman. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    

    @IBOutlet var toDoItem: UITextField!
    
    @IBAction func addItem(sender: AnyObject) {
        
        if toDoItem.text != nil {
        
            toDoItems.append(toDoItem.text)
        
            toDoItem.text = ""
        
            let fixedToDoItems = toDoItems
        
            NSUserDefaults.standardUserDefaults().setObject(fixedToDoItems, forKey: "toDoItems")
            NSUserDefaults.standardUserDefaults().synchronize()
        
            self.view.endEditing(true)
        
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }


}

