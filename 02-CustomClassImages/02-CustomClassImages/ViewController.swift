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
    let peopleDictionary = [
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
    
    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate   = self
        
        self.createPeople()
        
    }
    
    func createPeople() {
        for (_,personDictionary) in self.peopleDictionary.enumerate() {
            //NSLog("i: \(i) ; Person: \(person)")
            let person = Person()
            person.name = personDictionary["name"]!
            person.subtitle = personDictionary["subtitle"]!
            person.email = personDictionary["email"]!
            //We don't need to add the jpg extension
            person.photo = UIImage(named: personDictionary["name"]!.lowercaseString)!
            people.append(person)
        }
        
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.people.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel!.text = self.people[indexPath.row].name
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.performSegueWithIdentifier("toDetailSegue", sender: self.people[indexPath.row])
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detail = segue.destinationViewController as! DetailViewController
        detail.person = sender as! Person
    }
    
}

