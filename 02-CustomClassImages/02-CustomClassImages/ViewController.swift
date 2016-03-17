//
//  ViewController.swift
//  02-CustomClassImages
//
//  Created by Antonio Sejas on 16/3/16.
//  Copyright © 2016 Antonio Sejas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var tableView: UITableView!
    let people = [
        [
            "name":"Ginger",
            "subtitle":"CTO",
            "email": "ginger@email.com"
        ],
        [
            "name":"Rosane",
            "subtitle":"CEO",
            "email": "rosane@email.com"
        ],
        [
            "name":"Paul",
            "subtitle":"CMO",
            "email": "paul@email.com"
        ],
        [
            "name":"Zac",
            "subtitle":"ENGINEER",
            "email": "zac@email.com"
        ]
    ]
    var selected = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate   = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.people.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.textLabel!.text = self.people[indexPath.row]["name"]!
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.selected = indexPath.row
        self.performSegueWithIdentifier("toDetailSegue", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detail = segue.destinationViewController as! DetailViewController
        detail.name = self.people[selected]["name"]!
        detail.subtitle = self.people[selected]["subtitle"]!
        detail.email = self.people[selected]["email"]!
        
    }
    
}

