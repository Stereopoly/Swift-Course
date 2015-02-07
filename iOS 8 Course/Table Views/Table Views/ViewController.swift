//
//  ViewController.swift
//  Table Views
//
//  Created by Oscar Bjorkman on 1/7/15.
//  Copyright (c) 2015 Oscar Bjorkman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    let arr = ["Oscar", "Oliver", "Anders", "Evelyn"]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arr.count    // number of rows in section
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = arr[indexPath.row]
        
        return cell
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

