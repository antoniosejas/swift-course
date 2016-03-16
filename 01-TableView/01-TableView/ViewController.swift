//
//  ViewController.swift
//  01-TableView
//
//  Created by Antonio Sejas on 15/3/16.
//  Copyright © 2016 Antonio Sejas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    let people = [
        [
            "name":"Ginger",
            "subtitle":"CTO"
        ],
        [
            "name":"Rosane",
            "subtitle":"CEO"
        ],
        [
            "name":"Paul",
            "subtitle":"CMO"
        ],
        [
            "name":"Zac",
            "subtitle":"ENGINEER"
        ]
    ]
    var selected = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.people.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = UIColor.yellowColor()
        cell.textLabel!.text = self.people[indexPath.row]["name"]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selected = indexPath.row
        self.performSegueWithIdentifier("toDetailSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detailViewController = segue.destinationViewController as! DetailViewController
        detailViewController.name = self.people[self.selected]["name"]!
        detailViewController.subtitle = self.people[self.selected]["subtitle"]!
    }
}

