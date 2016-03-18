//
//  ViewController.swift
//  03-ColorsTableView
//
//  Created by Antonio Sejas on 18/3/16.
//  Copyright © 2016 Antonio Sejas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var colors = [
        [
            "name": "Red",
            "code": UIColor.redColor()
        ],
        [
            "name": "Purple",
            "code": UIColor.purpleColor()
        ],
        [
            "name": "Green",
            "code": UIColor.greenColor()
        ],
        [
            "name": "Blue",
            "code": UIColor(red: 123/255, green: 123/255, blue: 255/255, alpha: 1)
        ],
        [
            "name": "Gray",
            "code": UIColor.grayColor()
        ],
        [
            "name": "Yellow",
            "code": UIColor.yellowColor()
        ],
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = self.colors[indexPath.row]["code"] as? UIColor
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        performSegueWithIdentifier("toColorDetail", sender: self.colors[indexPath.row])
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if("toColorDetail" == segue.identifier){
            let detailVC = segue.destinationViewController as! ColorDetailViewController
            if let color = sender!["code"] {
                detailVC.color = color as! UIColor
            }
            if let name = sender!["name"] {
                NSLog("name: \(name)")
                detailVC.stringTitle = name as! String
            }
        }
    }
}

