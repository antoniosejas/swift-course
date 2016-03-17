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
    var person = Person()
    
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
        let cell = UITableViewCell()
        cell.textLabel!.text = self.people[indexPath.row]["name"]!
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.person.name = self.people[indexPath.row]["name"]!
        self.person.subtitle = self.people[indexPath.row]["subtitle"]!
        self.person.email = self.people[indexPath.row]["email"]!
        self.performSegueWithIdentifier("toDetailSegue", sender: person)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detail = segue.destinationViewController as! DetailViewController
        detail.person = sender as! Person
    }
    
}

